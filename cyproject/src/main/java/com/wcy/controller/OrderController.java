package com.wcy.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayResponse;
import com.alipay.api.response.AlipayTradePrecreateResponse;
import com.alipay.demo.trade.Main;
import com.alipay.demo.trade.config.Configs;
import com.alipay.demo.trade.model.ExtendParams;
import com.alipay.demo.trade.model.GoodsDetail;
import com.alipay.demo.trade.model.builder.AlipayTradePrecreateRequestBuilder;
import com.alipay.demo.trade.model.result.AlipayF2FPrecreateResult;
import com.alipay.demo.trade.service.AlipayMonitorService;
import com.alipay.demo.trade.service.AlipayTradeService;
import com.alipay.demo.trade.service.impl.AlipayMonitorServiceImpl;
import com.alipay.demo.trade.service.impl.AlipayTradeServiceImpl;
import com.alipay.demo.trade.service.impl.AlipayTradeWithHBServiceImpl;
import com.alipay.demo.trade.utils.ZxingUtils;
import com.wcy.common.Dict;
import com.wcy.common.Result;
import com.wcy.pojo.Order;
import com.wcy.pojo.OrderItem;
import com.wcy.pojo.OrderModel;
import com.wcy.pojo.Product;
import com.wcy.pojo.User;
import com.wcy.service.OrderItemService;
import com.wcy.service.OrderService;
import com.wcy.service.ProductService;
import com.wcy.util.CurrentUserUtil;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

	@Resource
	private OrderService orderService;

	@Resource
	private OrderItemService orderItemService;

	@Resource
	private ProductService productService;

	private static Logger log = Logger.getLogger(OrderController.class);

	// 支付宝当面付2.0服务
	private static AlipayTradeService tradeService;

	// 支付宝当面付2.0服务（集成了交易保障接口逻辑）
	private static AlipayTradeService tradeWithHBService;

	// 支付宝交易保障接口服务，供测试接口api使用，请先阅读readme.txt
	private static AlipayMonitorService monitorService;

	static {
		/**
		 * 一定要在创建AlipayTradeService之前调用Configs.init()设置默认参数
		 * Configs会读取classpath下的zfbinfo.properties文件配置信息，如果找不到该文件则确认该文件是否在classpath目录
		 */
		Configs.init("zfbinfo.properties");

		/**
		 * 使用Configs提供的默认参数 AlipayTradeService可以使用单例或者为静态成员对象，不需要反复new
		 */
		tradeService = new AlipayTradeServiceImpl.ClientBuilder().build();

		// 支付宝当面付2.0服务（集成了交易保障接口逻辑）
		tradeWithHBService = new AlipayTradeWithHBServiceImpl.ClientBuilder().build();

		/**
		 * 如果需要在程序中覆盖Configs提供的默认参数, 可以使用ClientBuilder类的setXXX方法修改默认参数
		 * 否则使用代码中的默认设置
		 */
		monitorService = new AlipayMonitorServiceImpl.ClientBuilder()
				.setGatewayUrl("http://mcloudmonitor.com/gateway.do").setCharset("GBK").setFormat("json").build();
	}

	// 简单打印应答
	private void dumpResponse(AlipayResponse response) {
		if (response != null) {
			log.info(String.format("code:%s, msg:%s", response.getCode(), response.getMsg()));
			if (StringUtils.isNotEmpty(response.getSubCode())) {
				log.info(String.format("subCode:%s, subMsg:%s", response.getSubCode(), response.getSubMsg()));
			}
			log.info("body:" + response.getBody());
		}
	}

	@RequestMapping("/addOrder/{productId}")
	@ResponseBody
	public Result<Order> addOrder(Order order, @PathVariable Integer productId, HttpServletRequest request,
			HttpServletResponse response) {

		try {
			log.info("-----开始创建订单----------");
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("CURRENT_USER");
			if (user != null) {
				order.setUserId(user.getId());
			}
			//创建订单为未支付状态
			order.setStatus(Dict.OrderStatusEnum.NO_PAY.getCode());
			orderService.addOrder(order);
			Order saveOrder = orderService.selectById(order.getId());
			log.info("订单的编号为" + saveOrder.getOrderNo());
			log.info("-------订单创建成功--------");

			log.info("---------创建详单----------");
			// 得到商品信息
			Product product = new Product();
			product.setId(productId);
			if (product != null) {
				product = productService.getProductById(product);
			}

			OrderItem orderItem = new OrderItem();
			orderItem.setUserId(user.getId());
			orderItem.setOrderNo(saveOrder.getOrderNo());
			orderItem.setProductId(product.getId());
			orderItem.setProductName(product.getName());
			orderItem.setProductImage(product.getMainImage());
			orderItem.setCurrentUnitPrice(product.getPrice());
			orderItem.setTotalPrice(product.getPrice());
			int count = orderItemService.addOrderItem(orderItem);
			if (count > 0) {
				result.setCode(Dict.ReturnCode.SUCCESS);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result.setCode(Dict.ReturnCode.FAIL);
			log.info("-------订单创建出现错误-------");
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping("/orderList")
	public String orderList(HttpServletRequest request, HttpServletResponse response) {
		User user = CurrentUserUtil.getCurrentUser(request);
		if (user == null) {
			return "shop/account";
		}
		try {
			List<Order> orderList = orderService.orderList(user.getId());
			List<OrderModel> orderModelList = new ArrayList();
			for (Order order : orderList) {
				List<OrderItem> orderItemList = orderItemService.orderItemList(order.getOrderNo());
				OrderModel orderModel = new OrderModel();
				BeanUtils.copyProperties(order, orderModel);
				orderModel.setOrderItemList(orderItemList);
				orderModelList.add(orderModel);
			}
			request.setAttribute("orders", orderModelList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "shop/order";
	}

	@RequestMapping("/pay/{orderNo}")
	public String pay(HttpServletRequest request, @PathVariable Long orderNo) throws Exception {
		User user = CurrentUserUtil.getCurrentUser(request);
		Integer userId = user.getId();
		Order order = orderService.selectByUserIdAndOrderNo(userId, orderNo);
		Order updateOrder = new Order();
		
		//不管成功与否都改变订单状态，仅用于测试
		updateOrder.setId(order.getId());
		updateOrder.setStatus(Dict.OrderStatusEnum.PAID.getCode());
		
		
		orderService.update(order);
		List<OrderItem> orderItemList = orderItemService.orderItemList(orderNo);

		// (必填) 商户网站订单系统中唯一订单号，64个字符以内，只能包含字母、数字、下划线，
		// 需保证商户系统端不能重复，建议通过数据库sequence生成，
		String outTradeNo = String.valueOf(order.getOrderNo());

		// (必填) 订单标题，粗略描述用户的支付目的。如“xxx品牌xxx门店当面付扫码消费”
		String subject = "mmall当面付扫码消费";

		// (必填) 订单总金额，单位为元，不能超过1亿元
		// 如果同时传入了【打折金额】,【不可打折金额】,【订单总金额】三者,则必须满足如下条件:【订单总金额】=【打折金额】+【不可打折金额】
		String totalAmount = order.getPayment() + "";

		// (可选) 订单不可打折金额，可以配合商家平台配置折扣活动，如果酒水不参与打折，则将对应金额填写至此字段
		// 如果该值未传入,但传入了【订单总金额】,【打折金额】,则该值默认为【订单总金额】-【打折金额】
		String undiscountableAmount = "0";

		// 卖家支付宝账号ID，用于支持一个签约账号下支持打款到不同的收款账号，(打款到sellerId对应的支付宝账号)
		// 如果该字段为空，则默认为与支付宝签约的商户的PID，也就是appid对应的PID
		String sellerId = "";

		// 订单描述，可以对交易或商品进行一个详细地描述，比如填写"购买商品2件共15.00元"
		String body = "购买商品" + orderItemList.size() + "件共" + order.getPayment() + "元";

		// 商户操作员编号，添加此参数可以为商户操作员做销售统计
		String operatorId = "mmall";

		// (必填) 商户门店编号，通过门店号和商家后台可以配置精准到门店的折扣信息，详询支付宝技术支持
		String storeId = "mmall";

		// 业务扩展参数，目前可添加由支付宝分配的系统商编号(通过setSysServiceProviderId方法)，详情请咨询支付宝技术支持
		ExtendParams extendParams = new ExtendParams();
		extendParams.setSysServiceProviderId("2088100200300400500");

		// 支付超时，定义为120分钟
		String timeoutExpress = "120m";

		// 商品明细列表，需填写购买商品详细信息，
		List<GoodsDetail> goodsDetailList = new ArrayList<GoodsDetail>();
		// 创建一个商品信息，参数含义分别为商品id（使用国标）、名称、单价（单位为分）、数量，如果需要添加商品类别，详见GoodsDetail

		for (OrderItem oil : orderItemList) {
			String productId = oil.getProductId() + "";
			String productName = oil.getProductName() + "";
			Long price = oil.getTotalPrice().longValue();
			int count = oil.getQuantity();
			GoodsDetail goods = GoodsDetail.newInstance(productId, productName, price, count);
			// 创建好一个商品后添加至商品明细列表
			goodsDetailList.add(goods);
		}

		// 创建扫码支付请求builder，设置请求参数
		AlipayTradePrecreateRequestBuilder builder = new AlipayTradePrecreateRequestBuilder().setSubject(subject)
				.setTotalAmount(totalAmount).setOutTradeNo(outTradeNo).setUndiscountableAmount(undiscountableAmount)
				.setSellerId(sellerId).setBody(body).setOperatorId(operatorId).setStoreId(storeId)
				.setExtendParams(extendParams).setTimeoutExpress(timeoutExpress)
				// .setNotifyUrl("http://www.test-notify-url.com")//支付宝服务器主动通知商户服务器里指定的页面http路径,根据需要设置
				.setGoodsDetailList(goodsDetailList);

		AlipayF2FPrecreateResult result = tradeService.tradePrecreate(builder);
		switch (result.getTradeStatus()) {
		case SUCCESS:
			log.info("支付宝预下单成功: )");

			AlipayTradePrecreateResponse response = result.getResponse();
			dumpResponse(response);

			// 需要修改为运行机器上的路径
		      String basePath = request.getSession().getServletContext().getRealPath("/");
              String fileName = String.format("images%sqr-%s.png", File.separator, response.getOutTradeNo());
              String filePath = new StringBuilder(basePath).append(fileName).toString();
              ZxingUtils.getQRCodeImge(response.getQrCode(), 256, filePath);
              request.setAttribute("qrimage","qr-"+response.getOutTradeNo()+".png");
			break;

		case FAILED:
			log.error("支付宝预下单失败!!!");
			break;

		case UNKNOWN:
			log.error("系统异常，预下单状态未知!!!");
			break;

		default:
			log.error("不支持的交易状态，交易返回异常!!!");
			break;
		}

		return "shop/pay";
	}
	
	
	@RequestMapping("/system/index")
	public String  orderIndex(){
		return "system/order";
	}
	
	@RequestMapping("/system/getAllOrder")
	@ResponseBody
	public List<Order> getAllOrder(){
		return orderService.getAllOrder();
		
	}
}
