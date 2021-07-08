<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<!-- 스타일 -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" />
<title>BTS</title>
<!-- 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/loadingajax.js"></script>
<style>
placeholder {
	font-style: italic;
}
</style>
</head>
<body>
<jsp:include page="../loadingajax.jsp"></jsp:include>
	<div class="contents shadow">
		<table class="w100">
			<tr>
				<td class="w21px">
					<span class="left"><img class="back" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTQ5OC4xOTUzMTIgMjIyLjY5NTMxMmMtLjAxMTcxOC0uMDExNzE4LS4wMjM0MzctLjAyMzQzNy0uMDM1MTU2LS4wMzUxNTZsLTIwOC44NTU0NjgtMjA4Ljg0NzY1NmMtOC45MDIzNDQtOC45MDYyNS0yMC43MzgyODItMTMuODEyNS0zMy4zMjgxMjYtMTMuODEyNS0xMi41ODk4NDMgMC0yNC40MjU3ODEgNC45MDIzNDQtMzMuMzMyMDMxIDEzLjgwODU5NGwtMjA4Ljc0NjA5MyAyMDguNzQyMTg3Yy0uMDcwMzEzLjA3MDMxMy0uMTQwNjI2LjE0NDUzMS0uMjEwOTM4LjIxNDg0NC0xOC4yODEyNSAxOC4zODY3MTktMTguMjUgNDguMjE4NzUuMDg5ODQ0IDY2LjU1ODU5NCA4LjM3ODkwNiA4LjM4MjgxMiAxOS40NDUzMTIgMTMuMjM4MjgxIDMxLjI3NzM0NCAxMy43NDYwOTMuNDgwNDY4LjA0Njg3Ni45NjQ4NDMuMDcwMzEzIDEuNDUzMTI0LjA3MDMxM2g4LjMyNDIxOXYxNTMuNjk5MjE5YzAgMzAuNDE0MDYyIDI0Ljc0NjA5NCA1NS4xNjAxNTYgNTUuMTY3OTY5IDU1LjE2MDE1Nmg4MS43MTA5MzhjOC4yODEyNSAwIDE1LTYuNzE0ODQ0IDE1LTE1di0xMjAuNWMwLTEzLjg3ODkwNiAxMS4yODkwNjItMjUuMTY3OTY5IDI1LjE2Nzk2OC0yNS4xNjc5NjloNDguMTk1MzEzYzEzLjg3ODkwNiAwIDI1LjE2Nzk2OSAxMS4yODkwNjMgMjUuMTY3OTY5IDI1LjE2Nzk2OXYxMjAuNWMwIDguMjg1MTU2IDYuNzE0ODQzIDE1IDE1IDE1aDgxLjcxMDkzN2MzMC40MjE4NzUgMCA1NS4xNjc5NjktMjQuNzQ2MDk0IDU1LjE2Nzk2OS01NS4xNjAxNTZ2LTE1My42OTkyMTloNy43MTg3NWMxMi41ODU5MzcgMCAyNC40MjE4NzUtNC45MDIzNDQgMzMuMzMyMDMxLTEzLjgwODU5NCAxOC4zNTkzNzUtMTguMzcxMDkzIDE4LjM2NzE4Ny00OC4yNTM5MDYuMDIzNDM3LTY2LjYzNjcxOXptMCAwIiBmaWxsPSIjOGM2NmM4IiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+PC9nPjwvc3ZnPg==" /></span>
				</td>
				<td colspan="2">
					<h1 class="center">회원가입</h1>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<p>
						<span class="star">*</span>는 필수 입력 사항입니다.
					</p>
				</td>
			</tr>
		</table>
		<div class="center">
			<table class="w100 center .font1">
				<tr>
					<td rowspan="2" class="right w100px"><i
						class="far fa-check-circle step1"></i> <span class="agreement">약관동의</span>
					</td>
					<td class="barTop">&nbsp;</td>
					<td rowspan="2" class="left w100px"><i
						class="far fa-check-circle yet step2"></i> <span>회원정보</span></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		<form id="frmJoin">
			<div class="terms">
				<table>
					<tr>
						<td><input type="checkbox" id="checkAll"> <label
							for="checkAll">아래 모든 항목에 동의합니다.</label></td>
					</tr>
					<tr>
						<td><br>
							<p class="title">
								이용약관<span class="star">*</span>
							</p>
							<div class="termsDetail .font1">
								<ul>
									<li>본 약관은 회원과 회사 사이의 기본적인 사항을 규정하기 위한 것으로, 법인 회원의 경우 기본 약관
										제19조의 규정을 확인하여 주시기 바랍니다.</li>
									<li>회사는 미성년자 또는 제한능력자의 서비스 이용을 제한합니다. 회사는 미성년자 또는 제한능력자가
										회원으로 가입하였음을 확인한 경우 해당 회원을 회원의 동의 없이 탈퇴 처리할 수 있습니다.</li>
									<li>접속자가 회사의 서비스를 이용하기 위하여 회원의 계정, 비밀번호 기타 회원이 회사에게 제공한
										로그인 정보와 일치하는 정보를 기입하여 회사의 모바일/웹 페이지, 어플리케이션에 접속할 경우, 해당 접속 기간
										중 이루어지는 모든 거래 행위는 해당 회원의 진정한 의사에 기한 것으로 간주됩니다. 그러므로 회원은 계정,
										비밀번호 기타 정보에 대한 보안을 유지하여야 하고, 자신의 귀책사유에 의하여 개인정보가 유출됨에 따라 발생할 수
										있는 금융사고 또는 범죄로 인한 피해를 주의하여야 합니다.</li>
									<li>가상자산(Virtual asset, 이하 &lsquo;가상자산&rsquo;이라 합니다)는
										발행주체가 존재하지 아니하므로 대한민국 내외의 (회사를 포함하여 어떠한) 제3자도 가치를 보증하거나 지급을
										보증하지 아니합니다. 그러므로 가상자산의 가치는 대한민국을 포함한 세계 각 국의 법률, 대한민국을 포함한 세계
										각 국의 정책, 유권해석, 경제환경 등에 따라 매우 큰 변동성이 있을 수 있습니다. 특히, 가상자산의 거래에
										대한 법률행위의 해석은 국가 별로 상이하여 법정화폐와 다른 특유의 위험성이 내재되어 있으므로, 회원은 반드시 이
										점에 주의하여야 합니다.</li>
									<li>모의투자 서비스는 회원이 가상자산을 다른 회원과 거래하거나, 회원이 BTS 내 전자계좌에 보관하고
										있는 회원의 가상자산을 블록체인 네트워크를 통하여 타 전자계좌으로 보내거나 타 전자계좌으로부터 코인원 거래소 내
										회원의 전자계좌으로 받을 수 있는 서비스입니다. 현재 블록체인 기술은 제3자에 의하여 변조가 불가능한 것으로
										평가받고 있으나, 이는 기술의 발전 또는 기타 예상할 수 없는 사정에 의하여 언제든지 변경될 수 있습니다.</li>
									<li>회원이 회사의 서비스를 이용하여 가상자산을 거래하였을 경우, 해당 가상자산의 거래내역은 코인원
										거래서비스 시스템에 기록이 됩니다. 회사는 코인원 내 가상자산 거래 과정에서 체결된 거래에 관하여 일정한
										수수료를 지급받습니다.</li>
									<li>회원이 회사의 서비스를 이용하여 가상자산을 전송하거나 전송받는 경우, 해당 가상자산의 거래내역은
										블록체인 네트워크에 기록되어 전 세계의 가상자산 이용자가 해당 거래의 진실성 등을 확인할 수 있게 되고, 그
										과정에서 채굴자에게 일정한 수수료를 지급하여야 합니다. 이 때에 회사가 회원으로부터 지급받는 수수료는 채굴자에게
										지급되며 채굴 난이도가 상승하거나 전송 대기수요가 채굴 공급수요를 상회할 경우 채굴자는 더 높은 수수료를
										지급하는 블록체인을 먼저 채굴하게 되므로, 회사가 채굴자에게 지급하는 수수료는 변동성이 있습니다.</li>
									<li>회사는 365일, 24시간 서비스를 제공하기 위하여 노력하고 있으나, 이를 보증하는 것이
										아닙니다. 회원 또는 제3자의 불법행위 등으로 인하여 서비스가 일시 중단되거나 서비스에 오류가 발생하여 회원에게
										표시되는 거래기록이 실제의 기록과 상이하게 표시되는 등의 문제가 발생할 경우, 회사는 문제를 해결하고 서비스를
										재개합니다. 이 때, 회원은 회사에 대하여 회사가 보유하고 있는 거래 기록에 근거하여 가상자산의 실제 기록으로
										복구할 것을 요청할 수 있습니다.</li>
									<li>최근 스미싱, 파밍 등 전기통신금융사기의 수단으로 가상자산을 이용하는 경우가 발생하고 있습니다.
										그러므로 회원은 반드시 전기통신금융사기로 인하여 피해가 발생하지 않도록 스스로 주의를 기울여야 하고, 만일
										전기통신금융사기로 인하여 수사기관, 사법기관, 행정기관 기타 공권력의 조사가 이루어져 해당 계정 및 전자계좌
										등의 동결이 필요할 경우, 회사는 회원의 동의 없이 해당 계정 및 전자계좌 등을 동결할 수 있습니다.</li>
									<li>회원의 불법행위로 인하여 회사에게 손해가 발생할 경우, 회사는 회원에게 법률상 손해배상청구권을
										행사할 수 있습니다. 그러므로 반드시 법령을 준수하여 회사의 서비스를 이용하여 주시기 바랍니다.</li>
									<li>가상자산의 거래는 대한민국을 포함한 각 국 소재 각 거래소에서 이루어지므로, 회원은 자기 책임과
										비용 하에 코인원 거래서비스 상의 시세와 타 거래소의 시세를 확인하는 등의 방법으로 거래 대상 가상자산의 가치를
										평가하고 거래를 하여야 합니다. 특히 코인원 거래서비스를 포함한 타 거래소는 언제든지 서버 점검 등을 할 수
										있으므로, 서버 점검 전후의 시세 사이에는 급격한 차이가 있을 수 있습니다. 따라서 가상자산의 시세가 급상승
										또는 급하락하는 경우, 서버 점검이 종료된 직후에는 코인원 거래서비스에서 형성된 시장가격이 가상자산의 가치를
										적정하게 반영한 것인지를 평가할 필요가 있습니다.</li>
									<li>회사는 전기통신사업법에 의한 기간통신사업자를 포함한 사업자 또는 회원의 귀책사유로 인하여 장애가
										발생하거나 가상자산의 기반 블록체인 상의 하자가 발생하는 등 회사와 관련이 없는 사정으로 인하여 발생한 회원의
										손해를 보상하거나 배상하지 않습니다.</li>
									<li>회사는 안정적인 서비스 제공을 위하여 언제든지 서버 점검을 할 수 있고, 회원은 서버 점검이
										종료된 이후 가상자산을 거래할 수 있습니다. 특히 주문량의 폭주 등으로 인하여 전산장애가 발생하는 등의 사유로
										회원에게 손해가 발생할 수 있는 염려가 있을 때에는 필요 최소한의 범위에서 긴급점검을 진행함으로써 거래 시스템
										상의 오류 발생으로 인하여 회원에게 발생할 수 있는 손해를 예방하고 있습니다.</li>
								</ul>
							</div></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="termAgr" class="termCheck req"><label
							for="termAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td><br>
							<p class="title">
								개인정보 수집 및 이용<span class="star">*</span>
							</p>
							<div class="termsDetail .font1">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
								<p>본 개인정보 처리방침은 회사의 웹사이트의 제반 서비스에 적용되며, 다른 웹사이트에서 제공되는 서비스에
									대해서는 별개의 개인정보 처리방침이 적용될 수 있습니다.</p>
								<p>회사가 개인정보 처리방침을 개정할 때에는 웹사이트 공지사항(또는 개별공지)을 통하여 공지합니다.</p>
								<p>개인정보 처리방침은 다음과 같은 중요한 의미를 가지고 있습니다.</p>
								<ul class="indent dash">
									<li>회사는 이용자에게 회사가 수집하는 개인정보의 내역, 이용 방법, 제공 또는 위탁되는 정보, 파기
										방법 등을 개인정보 처리방침을 통해 알려드리고 있습니다.</li>
									<li>이용자는 개인정보자기결정권을 비롯한 자신의 개인정보에 대한 법률상 권리를 보유하고 있습니다.
										그리고 개인정보 처리방침은 이용자의 개인정보에 대한 법률상 권리의 행사 방법을 안내합니다.</li>
									<li>또한 개인정보 침해사고를 예방하고, 사고가 이미 발생하였을 때 피해를 복구하기 위한 방법을
										안내합니다.</li>
								</ul>
								<h3>1. 개인정보의 처리 목적</h3>
								<p>회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는
									사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 받습니다.</p>
								<ul class="indent">
									<li>가. 홈페이지 회원가입 및 관리<br />회원 가입의사 확인, 회원제 서비스 제공에 따른 본인
										식별&middot;인증, 회원자격 유지&middot;관리, 서비스 부정이용 방지, 각종 고지&middot;통지,
										고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>나. 재화 또는 서비스 제공<br />서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 수수료
										결제&middot;정산, 경품 당첨 안내 및 상품 배송, 제세공과금 처리 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>다. 서비스 이용자의 본인확인 및 회원정보 변경업무 처리<br />본인 인증, 계좌 인증, 점유
										인증, 연령 인증, 신분증 진위여부 확인, 신분증 점유 확인 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>라. 마케팅 및 광고에의 활용<br />신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트
										및 광고성 정보 제공 및 상품배송, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인,
										접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 작성 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>마. 대한민국 및/또는 대한민국 외의 법령상 의무 이행 등을 위한 자료 제공<br />검찰/경찰
										등 범죄 수사, 피해 신고에 따른 자료 제공, 과세당국의 요청에 따른 과세자료 제공, 은행의 본인 확인을 위한
										자료 제공 등을 목적으로 개인정보를 처리합니다.
									</li>
								</ul>
								<h3>2. 개인정보의 처리 및 보유기간</h3>
								<p>가. 수집하는 개인정보의 항목</p>
								<ul>
								<li>① 필수 항목 : 이메일, 닉네임, 비밀번호, 모의투자 계좌 비밀번호, 생년월일</li>
								<li>② 선택 항목 : 성별, 연락처</li>
								</ul>
								<p>나. 개인정보의 수집 방법</p>
								<p>회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
								<ul class="indent circle-number">
									<li>① 최초 회원가입 또는 서비스 이용 시</li>
									<li>② 제휴사의 제공</li>
								</ul>
								<p>다. 보유근거 : 회원의 동의</p>
								<p>라. 보유기간</p>
								<ul class="indent circle-number">
									<li>① 이용자의 탈퇴 요청 및 개인정보 동의를 철회하는 때까지. 다만, 회사는 회사의 약관에 따른
										회원의 부정이용기록 또는 부정이용이 의심되는 기록이 있는 경우에는 이용자의 탈퇴 요청 및 개인정보 동의의
										철회에도 불구하고, 수집 시점으로부터 5년간 보관하고 파기합니다.</li>
								</ul>
								<p>마. 회사의 개인정보 처리방침에도 불구하고, 아래와 같은 관련법령에 의하여 보관하여야 하는 정보는
									법령이 정한 기간 동안 보관됩니다.</p>

								<h3>3. 개인정보처리의 위탁</h3>
								<p>가. 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있으며
									위탁받은 업체가 관계 법령을 위반하지 않도록 관리&middot;감독하고 있습니다.</p>
								<p>나. 회사는 회사가 개인정보를 위탁업체에 제공하는 경우 위탁받은 업체가 개인정보보호 관계 법령을
									위반하지 않도록 관리 및 감독하고 있습니다.</p>
								<p>다. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록
									하겠습니다.</p>
								<h3>4. 개인정보의 제3자 제공</h3>
								<p>가. 회사는 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않으며 본 개인정보 처리방침에서 명시한
									목적 범위 내에서만 처리합니다. 그러나 이용자가 다음 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접
									동의하거나 관련 법령에 따라 회사에 개인정보 제출의무가 발생한 경우에 한하여 개인정보를 제공하고 있습니다.</p>

								<p>나. 회원은 가.항의 개인정보 제공에 대하여 동의하지 않을 수 있으며, 동의하지 아니하더라도 해당
									서비스를 이용할 수 없는 것 이외의 불이익은 없습니다.</p>
								<h3>5. 정보주체의 권리, 의무 및 그 행사방법</h3>
								<p>이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
								<p>가. 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
									단, 개인정보보호법 제35조 제4항, 제36조 제1항, 제37조 제2항 및 기타 관계 법령에 따라 제한될 수
									있으며, 다른 법령에서 수집 대상으로 명시되어 있는 개인 정보는 삭제, 처리정지 요구 권한이 제한될 수 있습니다.</p>
								<ul class="indent circle-number">
									<li>① 개인정보 열람요구</li>
									<li>② 개인정보 오류 등이 있을 경우 정정요구</li>
									<li>③ 개인정보 삭제요구</li>
									<li>④ 개인정보 처리정지 요구</li>
								</ul>
								<p>나. 가.항에 따른 권리 행사는 회사에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면,
									전자우편 또는 아래 표와 같은 방법으로 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다. 이는
									법정대리인의 경우에도 같습니다.</p>

								<p>다. 이용자가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를
									완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</p>
								<p>라. 가.항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수
									있습니다. 이 경우 개인정보 처리 방법에 관한 고시 별지 제11호 서식에 따라 위임장을 제출하여야 합니다.</p>
								<p>마. 개인정보 수집 및 이용에 동의를 거부할 수 있으며 동의를 거부하는 경우 코인원 비대면 본인인증이
									제한됩니다.</p>
								<h3>6. 개인정보의 파기</h3>
								<p>가. 회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 단,
									이용자에게 별도의 동의를 받은 경우 또는 다른 법령에서 일정 기간 보존 의무를 부과하는 경우에는 해당 기간 동안
									다른 개인 정보와 분리하여 보관합니다.</p>
								<p>나. 개인정보 파기의 절차, 기한 및 방법은 다음과 같습니다.</p>
								<ul class="indent circle-number">
									<li>① 파기절차 : 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의
										서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진
										개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
									<li>② 파기기한 : 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터
										5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을
										때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</li>
									<li>③ 파기방법 : 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.
										종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
								</ul>
								<h3>7. 개인정보의 안전한 보호 및 관리</h3>
								<p>회사는 개인정보보호법 제29조(안전조치의 의무)에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적
									및 물리적 조치를 하고 있습니다. 위와 같은 노력 이외에 이용자 스스로도 제3자에게 패스워드 등이 노출되지 않도록
									주의하여야 합니다. 특히 패스워드 등이 공공장소에 설치한 PC를 통하여 유출되지 않도록 유의하여야 하며,
									정기적으로 패스워드를 바꾸는 것이 중요합니다.</p>
								<p>가. 해킹 등에 대비한 기술적 대책</p>
								<p>회사는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고
									주기적인 갱신&middot;점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시
									및 차단하고 있습니다. 또한, 접속 기록의 위조, 변조를 방지하기 위해 별도의 안전한 공간에 저장하고 있습니다.</p>
								<p>나. 개인정보의 암호화</p>
								<p>이용자의 개인정보는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일
									및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</p>
								<p>다. 개인정보에 대한 접근 제한</p>
								<p>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한
									접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</p>
								<p>라. 문서보안을 위한 잠금장치 사용</p>
								<p>개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</p>
								<p>마. 비인가자에 대한 출입 통제</p>
								<p>개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고
									있습니다.</p>
								<h3>8. 개인정보 보호책임자</h3>
								<p>가. 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리
									및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
								<p>나. 정보주체는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제
									등에 관한 사항을 개인정보 보호책임자에게 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및
									처리해드릴 것입니다.</p>
								<p>다. 이용자 개인정보와 관련한 아이디(ID) 및 패스워드에 대한 보안유지책임은 해당 이용자 자신에게
									있습니다. 회사는 패스워드에 대해 어떠한 방법으로도 이용자에게 직접적으로 질문하는 경우는 없으므로 타인에게
									패스워드가 유출되지 않도록 각별히 주의하시기 바랍니다. 특히 공공장소에서 온라인상에서 접속해 있을 경우에는 더욱
									유의하셔야 합니다.</p>
								<p>라. 회사가 가능한 기술적인 보완조치를 했음에도 불구하고, 첨단 기술을 이용한 해킹 등 네트워크 상의
									위험에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손에 관해서는 책임이 없습니다.</p>
								<p>마. 회사는 본 개인정보 처리방침에도 불구하고 대한민국 법령에 근거하여 개인정보 제공 의무를 부담하는
									경우, 법원의 명령에 따라 이를 제공할 수 있습니다.</p>
								<h3>9. 개인정보 상담 및 신고</h3>
								<p>개인정보침해에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 사이버범죄수사과, 경찰청
									사이버안전국 등으로 문의하실 수 있습니다.</p>
								<ul class="indent circle">
									<li>개인정보 침해신고센터 (한국인터넷진흥원 운영)
										<ul class="indent">
											<li>소관업무: 개인정보 침해사실 신고, 상담 신청</li>
											<li><i class="glyphicon glyphicon-globe"></i> https://privacy.kisa.or.kr</li>
											<li><i class="glyphicon glyphicon-earphone"></i> (국번없이) 118</li>
										</ul>
									</li>
									<li>개인정보 분쟁조정위원회 (한국인터넷진흥원 운영)
										<ul class="indent">
											<li>소관업무: 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)</li>
											<li><i class="glyphicon glyphicon-globe"></i> <a href="https://www.kopico.go.kr">https://www.kopico.go.kr</a></li>
											<li><i class="glyphicon glyphicon-earphone"></i> 1833-6972</li>
										</ul>
									</li>
									<li>대검찰청 사이버수사과
										<ul class="indent">
											<li><i class="glyphicon glyphicon-globe"></i> <a href="https://www.spo.go.kr">https://www.spo.go.kr</a></li>
											<li><i class="glyphicon glyphicon-earphone"></i> (국번없이) 1301</li>
										</ul>
									</li>
									<li>경찰청 사이버수사국
										<ul class="indent">
											<li><i class="glyphicon glyphicon-globe"></i> <a href="https://ecrm.cyber.go.kr">https://ecrm.cyber.go.kr</a></li>
											<li><i class="glyphicon glyphicon-earphone"></i> (국번없이) 182</li>
										</ul>
									</li>
								</ul>
								<h3>11. 링크 사이트에 대한 책임</h3>
								<p>회사는 이용자에게 다른 외부사이트로 연결되는 링크를 제공할 수 있습니다. 이 경우 회사는 외부사이트에
									대한 통제권이 없으므로 이용자가 외부사이트로부터 제공받는 서비스나 자료의 유용성, 진실성, 적법성에 대해 책임 및
									보증할 수 없으며, 링크된 외부사이트의 개인정보 처리방침은 회사와 무관하므로 해당 외부사이트의 정책을 확인하시기
									바랍니다.</p>
								<h3>12. 개인정보 처리방침 변경</h3>
								<p>이 개인정보 처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이
									있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지됩니다.</p>
								<h3>부칙</h3>
								<ul>
									<li>(공고일) 이 개인정보 처리방침은 2021년 6월 9일에 공고 되었습니다</li>
									<li>(시행일) 이 개인정보 처리방침은 2021년 6월 9일부터 적용됩니다.</li>
								</ul>
							</div></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="reqAgr" class="termCheck req"><label
							for="reqAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td><br>
							<p class="title">이벤트 및 정보 수신</p>
							<div class="termsDetail .font1">
								<p>BTS(이하 '회사')는 정보통신망 이용촉진 및 정보보호 등에 관한 법률(이하
									&lsquo;정보통신망법'), 개인정보보호법에 따라 이용자의 개인정보 및 권익을 보호하고 개인정보와 관련된
									이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다.</p>
								<p>본 개인정보 처리방침은 회사의 웹사이트의 제반 서비스에 적용되며, 다른 웹사이트에서 제공되는 서비스에
									대해서는 별개의 개인정보 처리방침이 적용될 수 있습니다.</p>
								<p>회사가 개인정보 처리방침을 개정할 때에는 웹사이트 공지사항(또는 개별공지)을 통하여 공지합니다.</p>
								<p>개인정보 처리방침은 다음과 같은 중요한 의미를 가지고 있습니다.</p>
								<ul class="indent dash">
									<li>회사는 이용자에게 회사가 수집하는 개인정보의 내역, 이용 방법, 제공 또는 위탁되는 정보, 파기
										방법 등을 개인정보 처리방침을 통해 알려드리고 있습니다.</li>
									<li>이용자는 개인정보자기결정권을 비롯한 자신의 개인정보에 대한 법률상 권리를 보유하고 있습니다.
										그리고 개인정보 처리방침은 이용자의 개인정보에 대한 법률상 권리의 행사 방법을 안내합니다.</li>
									<li>또한 개인정보 침해사고를 예방하고, 사고가 이미 발생하였을 때 피해를 복구하기 위한 방법을
										안내합니다.</li>
								</ul>
								<h3>1. 개인정보의 처리 목적</h3>
								<p>회사는 개인정보를 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는
									사용되지 않으며 이용 목적이 변경될 시에는 사전동의를 받습니다.</p>
								<ul class="indent">
									<li>가. 홈페이지 회원가입 및 관리<br />회원 가입의사 확인, 회원제 서비스 제공에 따른 본인
										식별&middot;인증, 회원자격 유지&middot;관리, 서비스 부정이용 방지, 각종 고지&middot;통지,
										고충처리, 분쟁 조정을 위한 기록 보존 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>나. 재화 또는 서비스 제공<br />서비스 제공, 콘텐츠 제공, 맞춤 서비스 제공, 수수료
										결제&middot;정산, 경품 당첨 안내 및 상품 배송, 제세공과금 처리 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>다. 서비스 이용자의 본인확인 및 회원정보 변경업무 처리<br />본인 인증, 계좌 인증, 점유
										인증, 연령 인증, 신분증 진위여부 확인, 신분증 점유 확인 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>라. 마케팅 및 광고에의 활용<br />신규 서비스(제품) 개발 및 맞춤 서비스 제공, 이벤트
										및 광고성 정보 제공 및 상품배송, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인,
										접속빈도 파악 또는 회원의 서비스 이용에 대한 통계 작성 등을 목적으로 개인정보를 처리합니다.
									</li>
									<li>마. 대한민국 및/또는 대한민국 외의 법령상 의무 이행 등을 위한 자료 제공<br />검찰/경찰
										등 범죄 수사, 피해 신고에 따른 자료 제공, 과세당국의 요청에 따른 과세자료 제공, 은행의 본인 확인을 위한
										자료 제공 등을 목적으로 개인정보를 처리합니다.
									</li>
								</ul>
								<h3>2. 개인정보의 처리 및 보유기간</h3>
								<p>가. 수집하는 개인정보의 항목</p>
								<ul>
								<li>① 필수 항목 : 이메일, 닉네임, 비밀번호, 모의투자 계좌 비밀번호, 생년월일</li>
								<li>② 선택 항목 : 성별, 연락처</li>
								</ul>
								<p>나. 개인정보의 수집 방법</p>
								<p>회사는 다음과 같은 방법으로 개인정보를 수집합니다.</p>
								<ul class="indent circle-number">
									<li>① 최초 회원가입 또는 서비스 이용 시</li>
									<li>② 제휴사의 제공</li>
								</ul>
								<p>다. 보유근거 : 회원의 동의</p>
								<p>라. 보유기간</p>
								<ul class="indent circle-number">
									<li>① 이용자의 탈퇴 요청 및 개인정보 동의를 철회하는 때까지. 다만, 회사는 회사의 약관에 따른
										회원의 부정이용기록 또는 부정이용이 의심되는 기록이 있는 경우에는 이용자의 탈퇴 요청 및 개인정보 동의의
										철회에도 불구하고, 수집 시점으로부터 5년간 보관하고 파기합니다.</li>
								</ul>
								<p>마. 회사의 개인정보 처리방침에도 불구하고, 아래와 같은 관련법령에 의하여 보관하여야 하는 정보는
									법령이 정한 기간 동안 보관됩니다.</p>

								<h3>3. 개인정보처리의 위탁</h3>
								<p>가. 회사는 원활한 개인정보 업무 처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있으며
									위탁받은 업체가 관계 법령을 위반하지 않도록 관리&middot;감독하고 있습니다.</p>
								<p>나. 회사는 회사가 개인정보를 위탁업체에 제공하는 경우 위탁받은 업체가 개인정보보호 관계 법령을
									위반하지 않도록 관리 및 감독하고 있습니다.</p>
								<p>다. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록
									하겠습니다.</p>
								<h3>4. 개인정보의 제3자 제공</h3>
								<p>가. 회사는 이용자의 사전 동의 없이 개인정보를 외부에 제공하지 않으며 본 개인정보 처리방침에서 명시한
									목적 범위 내에서만 처리합니다. 그러나 이용자가 다음 외부 제휴사의 서비스를 이용하기 위하여 개인정보 제공에 직접
									동의하거나 관련 법령에 따라 회사에 개인정보 제출의무가 발생한 경우에 한하여 개인정보를 제공하고 있습니다.</p>

								<p>나. 회원은 가.항의 개인정보 제공에 대하여 동의하지 않을 수 있으며, 동의하지 아니하더라도 해당
									서비스를 이용할 수 없는 것 이외의 불이익은 없습니다.</p>
								<h3>5. 정보주체의 권리, 의무 및 그 행사방법</h3>
								<p>이용자는 개인정보주체로서 다음과 같은 권리를 행사할 수 있습니다.</p>
								<p>가. 정보주체는 회사에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
									단, 개인정보보호법 제35조 제4항, 제36조 제1항, 제37조 제2항 및 기타 관계 법령에 따라 제한될 수
									있으며, 다른 법령에서 수집 대상으로 명시되어 있는 개인 정보는 삭제, 처리정지 요구 권한이 제한될 수 있습니다.</p>
								<ul class="indent circle-number">
									<li>① 개인정보 열람요구</li>
									<li>② 개인정보 오류 등이 있을 경우 정정요구</li>
									<li>③ 개인정보 삭제요구</li>
									<li>④ 개인정보 처리정지 요구</li>
								</ul>
								<p>나. 가.항에 따른 권리 행사는 회사에 대해 개인정보 보호법 시행규칙 별지 제8호 서식에 따라 서면,
									전자우편 또는 아래 표와 같은 방법으로 하실 수 있으며 회사는 이에 대해 지체 없이 조치하겠습니다. 이는
									법정대리인의 경우에도 같습니다.</p>

								<p>다. 이용자가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를
									완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</p>
								<p>라. 가.항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수
									있습니다. 이 경우 개인정보 처리 방법에 관한 고시 별지 제11호 서식에 따라 위임장을 제출하여야 합니다.</p>
								<p>마. 개인정보 수집 및 이용에 동의를 거부할 수 있으며 동의를 거부하는 경우 코인원 비대면 본인인증이
									제한됩니다.</p>
								<h3>6. 개인정보의 파기</h3>
								<p>가. 회사는 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 단,
									이용자에게 별도의 동의를 받은 경우 또는 다른 법령에서 일정 기간 보존 의무를 부과하는 경우에는 해당 기간 동안
									다른 개인 정보와 분리하여 보관합니다.</p>
								<p>나. 개인정보 파기의 절차, 기한 및 방법은 다음과 같습니다.</p>
								<ul class="indent circle-number">
									<li>① 파기절차 : 이용자가 입력한 정보는 목적 달성 후 별도의 DB에 옮겨져(종이의 경우 별도의
										서류) 내부 방침 및 기타 관련 법령에 따라 일정기간 저장된 후 혹은 즉시 파기됩니다. 이 때, DB로 옮겨진
										개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
									<li>② 파기기한 : 이용자의 개인정보는 개인정보의 보유기간이 경과된 경우에는 보유기간의 종료일로부터
										5일 이내에, 개인정보의 처리 목적 달성, 해당 서비스의 폐지, 사업의 종료 등 그 개인정보가 불필요하게 되었을
										때에는 개인정보의 처리가 불필요한 것으로 인정되는 날로부터 5일 이내에 그 개인정보를 파기합니다.</li>
									<li>③ 파기방법 : 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다.
										종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
								</ul>
								<h3>7. 개인정보의 안전한 보호 및 관리</h3>
								<p>회사는 개인정보보호법 제29조(안전조치의 의무)에 따라 다음과 같이 안전성 확보에 필요한 기술적/관리적
									및 물리적 조치를 하고 있습니다. 위와 같은 노력 이외에 이용자 스스로도 제3자에게 패스워드 등이 노출되지 않도록
									주의하여야 합니다. 특히 패스워드 등이 공공장소에 설치한 PC를 통하여 유출되지 않도록 유의하여야 하며,
									정기적으로 패스워드를 바꾸는 것이 중요합니다.</p>
								<p>가. 해킹 등에 대비한 기술적 대책</p>
								<p>회사는 해킹이나 컴퓨터 바이러스 등에 의한 개인정보 유출 및 훼손을 막기 위하여 보안프로그램을 설치하고
									주기적인 갱신&middot;점검을 하며 외부로부터 접근이 통제된 구역에 시스템을 설치하고 기술적/물리적으로 감시
									및 차단하고 있습니다. 또한, 접속 기록의 위조, 변조를 방지하기 위해 별도의 안전한 공간에 저장하고 있습니다.</p>
								<p>나. 개인정보의 암호화</p>
								<p>이용자의 개인정보는 암호화 되어 저장 및 관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일
									및 전송 데이터를 암호화 하거나 파일 잠금 기능을 사용하는 등의 별도 보안기능을 사용하고 있습니다.</p>
								<p>다. 개인정보에 대한 접근 제한</p>
								<p>개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여, 변경, 말소를 통하여 개인정보에 대한
									접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.</p>
								<p>라. 문서보안을 위한 잠금장치 사용</p>
								<p>개인정보가 포함된 서류, 보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다.</p>
								<p>마. 비인가자에 대한 출입 통제</p>
								<p>개인정보를 보관하고 있는 물리적 보관 장소를 별도로 두고 이에 대해 출입통제 절차를 수립, 운영하고
									있습니다.</p>
								<h3>8. 개인정보 보호책임자</h3>
								<p>가. 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리
									및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.</p>
								<p>나. 정보주체는 회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제
									등에 관한 사항을 개인정보 보호책임자에게 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및
									처리해드릴 것입니다.</p>
								<p>다. 이용자 개인정보와 관련한 아이디(ID) 및 패스워드에 대한 보안유지책임은 해당 이용자 자신에게
									있습니다. 회사는 패스워드에 대해 어떠한 방법으로도 이용자에게 직접적으로 질문하는 경우는 없으므로 타인에게
									패스워드가 유출되지 않도록 각별히 주의하시기 바랍니다. 특히 공공장소에서 온라인상에서 접속해 있을 경우에는 더욱
									유의하셔야 합니다.</p>
								<p>라. 회사가 가능한 기술적인 보완조치를 했음에도 불구하고, 첨단 기술을 이용한 해킹 등 네트워크 상의
									위험에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손에 관해서는 책임이 없습니다.</p>
								<p>마. 회사는 본 개인정보 처리방침에도 불구하고 대한민국 법령에 근거하여 개인정보 제공 의무를 부담하는
									경우, 법원의 명령에 따라 이를 제공할 수 있습니다.</p>
								<h3>9. 개인정보 상담 및 신고</h3>
								<p>개인정보침해에 관한 상담이 필요한 경우에는 개인정보침해신고센터, 대검찰청 사이버범죄수사과, 경찰청
									사이버안전국 등으로 문의하실 수 있습니다.</p>
								<ul class="indent circle">
									<li>개인정보 침해신고센터 (한국인터넷진흥원 운영)
										<ul class="indent">
											<li>소관업무: 개인정보 침해사실 신고, 상담 신청</li>
											<li><i class="glyphicon glyphicon-globe"></i> https://privacy.kisa.or.kr</li>
											<li><i class="glyphicon glyphicon-earphone"></i> (국번없이) 118</li>
										</ul>
									</li>
									<li>개인정보 분쟁조정위원회 (한국인터넷진흥원 운영)
										<ul class="indent">
											<li>소관업무: 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결)</li>
											<li><i class="glyphicon glyphicon-globe"></i> <a href="https://www.kopico.go.kr">https://www.kopico.go.kr</a></li>
											<li><i class="glyphicon glyphicon-earphone"></i> 1833-6972</li>
										</ul>
									</li>
									<li>대검찰청 사이버수사과
										<ul class="indent">
											<li><i class="glyphicon glyphicon-globe"></i> <a href="https://www.spo.go.kr">https://www.spo.go.kr</a></li>
											<li><i class="glyphicon glyphicon-earphone"></i> (국번없이) 1301</li>
										</ul>
									</li>
									<li>경찰청 사이버수사국
										<ul class="indent">
											<li><i class="glyphicon glyphicon-globe"></i> <a href="https://ecrm.cyber.go.kr">https://ecrm.cyber.go.kr</a></li>
											<li><i class="glyphicon glyphicon-earphone"></i> (국번없이) 182</li>
										</ul>
									</li>
								</ul>
								<h3>11. 링크 사이트에 대한 책임</h3>
								<p>회사는 이용자에게 다른 외부사이트로 연결되는 링크를 제공할 수 있습니다. 이 경우 회사는 외부사이트에
									대한 통제권이 없으므로 이용자가 외부사이트로부터 제공받는 서비스나 자료의 유용성, 진실성, 적법성에 대해 책임 및
									보증할 수 없으며, 링크된 외부사이트의 개인정보 처리방침은 회사와 무관하므로 해당 외부사이트의 정책을 확인하시기
									바랍니다.</p>
								<h3>12. 개인정보 처리방침 변경</h3>
								<p>이 개인정보 처리방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이
									있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지됩니다.</p>
								<h3>부칙</h3>
								<ul>
									<li>(공고일) 이 개인정보 처리방침은 2021년 6월 9일에 공고 되었습니다</li>
									<li>(시행일) 이 개인정보 처리방침은 2021년 6월 9일부터 적용됩니다.</li>
								</ul>
							</div></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="optAgr" class="termCheck"
							name="mailing"><label for="optAgr">동의합니다.</label></td>
					</tr>
					<tr>
						<td class="red"><i class="fas fa-exclamation-triangle"></i>19세
							미만은 가입 및 서비스 이용이 제한됩니다.</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><input type="button" value="다음" id="next" class="btn1"></td>
					</tr>
				</table>
			</div>
			<div class="insertInfo">
				<table class="w100">
					<tr>
						<td colspan="2">이메일<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="email" id="email"
							class="reqInfo" placeholder="이메일을 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert emailReg emailICh emailCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">닉네임<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="nickname"
							id="nickname" class="reqInfo" placeholder="닉네임을 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert nickReg nickCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">비밀번호<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="pw" id="pw"
							class="reqInfo" placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert pwReg pwICh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">비밀번호 확인<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="pwCh" id="pwCh"
							class="reqInfo" placeholder="비밀번호를 다시 한 번 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert pwCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">계좌 비밀번호<span class="star">*</span></td>
					</tr>
					<tr>
						<td colspan="2"><input type="password" name="bankPw"
							id="bankPw" class="pin1 reqInfo" placeholder="계좌 비밀번호를 입력해주세요."
							readonly></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td><label for="gender">성별</label></td>
						<td><label for="birthdate">생년월일</label><span class="star">*</span><span class="alert"
							id="bdlabel"> 만 19세 이상만 가입할 수 있습니다.</span></td>
					</tr>
					<tr>
						<td><select name="gender" id="gender">
								<option value="">선택안함</option>
								<option value="M">남자</option>
								<option value="F">여자</option>
						</select></td>
						<td><input type="date" name="birthdate" id="birthdate"></td>
					</tr>
					<tr>
						<td><p>&nbsp;</p></td>
						<td><p class="alert ageCh">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2">연락처</td>
					</tr>
					<tr>
						<td colspan="2"><input type="text" name="phone" id="phone"
							placeholder="연락처를 숫자로만 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert phoneReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td colspan="2"><button type="button" id="insert"
								class="btn1">회원 가입</button></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
<script>
	//pinpad 생성
	new pinpad({
		ref : {
			el : '.pin1'
		},
		immediate : false,
		maxLength : 4,
		close : '<i class="far fa-times-circle"></i>',
		desc : 'ACCOUNT PASSWORD',
		passcode : true,
		letterReplace : {
			'del' : '<i class="fas fa-times delete"></i>',
			'done' : '<i class="fas fa-check done"></i>',
		}
	});
</script>
</html>