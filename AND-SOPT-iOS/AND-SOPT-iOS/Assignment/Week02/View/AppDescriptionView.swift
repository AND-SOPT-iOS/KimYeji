//
//  AppDescriptionView.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/24/24.
//

import UIKit

class AppDescriptionView: UIView {
    // MARK: - Components
    
    private let appInstallLabel: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가\n필요합니다."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        
        return label
    }()

    private let appInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "● 내 금융 현황을 한눈에, 홈·소비"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()

    private let appInfoMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("더 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.addTarget(nil, action: #selector(appInfoMoreButtonTapped), for: .touchUpInside)
        
        return button
    }()

    private let devloperInfoTextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Viva Republica", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        
        return button
    }()

    private let developerAppMoreButton: UIButton = {
        let button = UIButton()
        let shareIcon = UIImage(systemName: "chevron.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        button.setImage(shareIcon, for: .normal)
        button.tintColor = .lightGray
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()

    private let developerTextLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray
        
        return label
    }()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI, Layout
    private func setUI() {
        addSubviews(
            appInstallLabel, appInfoLabel, appInfoMoreButton,
            devloperInfoTextButton, developerTextLabel, developerAppMoreButton
        )
    }

    private func setLayout() {
        appInstallLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.horizontalEdges.equalToSuperview()
        }

        appInfoLabel.snp.makeConstraints {
            $0.top.equalTo(appInstallLabel.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
        }

        appInfoMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(appInfoLabel.snp.centerY)
            $0.trailing.equalToSuperview()
        }

        devloperInfoTextButton.snp.makeConstraints {
            $0.top.equalTo(appInfoLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }

        developerTextLabel.snp.makeConstraints {
            $0.top.equalTo(devloperInfoTextButton.snp.bottom).offset(-3)
            $0.leading.equalTo(devloperInfoTextButton.snp.leading)
        }

        developerAppMoreButton.snp.makeConstraints {
            $0.centerY.equalTo(devloperInfoTextButton.snp.centerY)
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    @objc private func appInfoMoreButtonTapped(){
        appInfoLabel.text = """
    ● 내 금융 현황을 한눈에, 홈·소비
    
    · 모든 계좌의 모든 정보를 한 곳에서, 따로 보았던 예적금, 청약, 증권, 대출 계좌의 정보를 한 곳에서 확인할 수 있어요.
    
    · 얼마나 벌고 얼마나 썼을까? 한 달 동안의 수입과 소비를 시간순으로 모아볼 수 있고, 소비 분석 리포트도 제공해드려요.
    
    · 카드 실적 헷갈릴 필요 없이, 실적을 충족한 카드가 무엇인지 얼마나 더 써야 실적을 달성하는지 한눈에 확인할 수 있어요.
    
    · 매달 고정적으로 나가는 보험비, 생활요금, 구독료 등도 쉽게 확인할 수 있어요.
    
    
    ● 평생 무료로 간편하고 안전하게, 송금
    
    · 송금을 자유롭게, 토스에서는 은행 상관없이 수수료가 평생 무료에요.
    
    · 송금을 안전하게, 송금 전 사기계좌를 미리 조회해 안전하게 송금할 수 있어요.
    
    · 송금을 간편하게, 단 한 번의 터치까지 줄였어요. 최소한의 터치로 송금하세요.
    
    · 그리고 마음까지, 간단한 메시지와 이모티콘을 함께 보내보세요.
    
    
    ● 지점에 가지 않아도 OK, 개설
    
    · 시간과 장소에 상관없이, 카드, 예·적금, 대출, 보험 등 다양한 금융상품을 개설할 수 있습니다.
    
    · 특별한 혜택은 덤으로, 토스에서만 드리는 혜택 또한 놓치지 마세요.
    
    
    ● 보험 관리를 한눈에, 보험
    
    · 가입한 보험과 월 보험료를 한눈에 확인하세요.
    
    · 또래에 비해 부족한 것은 없을까? 현재 가입한 보험의 보장을 참고해 부족한 보장을 추천해드립니다.
    
    · 전문가와 상담을 통해 내게 딱 맞는 보험을 추천 받고, 병원비도 간편하게 청구해 돌려받을 수 있어요.
    
    
    ● 누구나 받을 수 있는, 혜택
    
    · 좋아하는 브랜드를 더 사랑할 수 있도록, 1주일에 한 번씩 브랜드를 고르고 캐시백을 받아보세요.
    
    · 이번 주 미션을 달성하고 포인트를 받아보세요.
    
    · 걸음 수를 채우고 건강과 혜택을 한 번에, 만보기도 한번 사용해보세요.
    
    
    ● 쓸수록 커지는 혜택, 토스신용카드
    
    · 실적에 따라 더 큰 금액을 돌려드려요.
    
    · 결제 및 캐시백 내역을 토스 앱에서 확인할 수 있어요.
    
    · VISA 플래티늄 서비스 혜택 또한 누려보세요.
    
    
    ● 투자를 모두에게, 토스증권
    
    · 투자의 시작은 관심에서부터, 투자 판단에 도움을 주는 뉴스와 컨텐츠를 확인해보세요.
    
    · 송금처럼 쉬운 구매 경험, 이해하기 쉬운 용어로 나만의 주식 투자를 시작할 수 있어요.
    
    
    ● 완전히 새로운 은행, 토스뱅크
    
    · 채우고, 비우고, 자유롭게, 조건 없는 강력한 통장을 만나보세요.
    
    · 단 한 번의 조회로 가능, 어렵고 복잡한 과정 없는 대출이 기다리고 있어요.
    
    · 다채로운 컬러 그리고 아낌없이 주는 혜택, 토스뱅크 체크카드도 발급받아보세요.
    
    
    ● 가장 가까운 주민센터, 토스 주민센터
    
    · 정부24와 주민센터에서 발급 받았던 민원 증명서, 토스에서 빠르게 받고 낼 수 있어요.
    
    · 건강검진 일정 및 국가장학금 신청 안내, 교통범칙금·과태료 알림도 바로 받고 납부할 수 있어요.
    
    
    ● 사업을 하는 사장님도 편리하게, 내 매출 장부
    
    · 언제 얼마가 입금될까? 매일 알려드리고 매출, 입금 장부를 자동으로 써드려요.
    
    · 사장님 대상 지원 정책도 토스가 챙겨드릴게요.
    
    
    ● 안심하고 쓰세요
    
    · 대한민국 국민 3명 중 1명 사용, 누적 송금액 177조 원, 누적 다운로드 6,900만, 보안사고 0건 (2021년 8월 기준)
    
    · '2018 정보보호대상' 대상 수상 (과학기술정보통신부 주최)
    
    · 해킹 방어수준 25개 금융 앱 중 종합 1위 기록 (2017년 스틸리언 분석)
    
    · 카드사 수준 글로벌 데이터 보안 표준 'PCI-DSS' 업계 최초로 획득
    
    · 국제표준 정보보호 인증 ISO/IEC 27001 및 ISO/IEC 27701 취득
    
    · 24시간 관제 시스템과 이상금융거래탐지시스템으로 각종 위험을 예방
    
    
    ● 토스는 누가 운영하나요?
    
    토스는 핀테크 기업 '비바리퍼블리카'에서 운영합니다.
    
    비바리퍼블리카는 2019년 KPMG와 H2벤처스가 선정한 전 세계 100대 핀테크 기업 중 29위에 선정되었으며, 국내 핀테크 기업 중 가장 많은 은행 및 증권사와 공식 제휴를 맺고 있습니다. 또한 전자금융거래법 제28조에 따라, 보안과 관제 시스템에 대한 금융감독원의 실사 및 금융위원회의 승인을 통해 전자금융업으로 등록, 안전하게 서비스를 제공하고 있습니다.
    
    
    ● 꼭 필요한 권한만 요청합니다
    
    [선택 접근 권한]
    
    · 연락처 : 연락처를 통한 송금과 프로필 사진 등록
    
    · 알림 : ARS 인증번호를 받거나, 토스에서 전달하는 푸시 메세지 수신
    
    · 카메라 : QR코드 / 실물카드 / 신분증 인식, 이미지 업로드, 프로필 등록에 필요
    
    · 사진 : 이미지 저장/업로드 시 필요
    
    · 위치 : 현 위치 확인 및 표시, 부정거래 방지에 필요
    
    · 동작 및 피트니스 : 만보기 서비스에서 걸음 수 측정
    
    · Face ID : 토스 비밀번호 입력을 대체해 인증 진행 시 필요
    
    · 블루투스 : 근처에 있는 기기 식별 및 연결을 위해 필요
    
    * 선택 권한은 허용하지 않아도 서비스를 이용할 수 있으나, 일부 기능 사용에 제한이 있을 수 있습니다.
    
    
    ● 토스 고객센터는 365일 24시간 열려있습니다.
    
    · 전화 1599-4905
    
    · 카카오톡 @toss
    
    · 이메일 support@toss.im
    
    
    (주)비바리퍼블리카
    
    서울시 강남구 테헤란로 142 아크플레이스 12층
    """
        appInfoMoreButton.isHidden = true
    }
}
