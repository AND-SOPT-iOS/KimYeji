import Foundation

struct Review {
    let reviewTitle: String
    let reviewDate: String
    let userName: String
    let reviewStarScore: String
    let reviewContent: String
    let developerResponse: DeveloperResponse
}

extension Review {
    static let sampleReviews: [Review] = [
        Review(
            reviewTitle: "토스 UX 전버전으로 해주세요",
            reviewDate: "9월 27일",
            userName: "김예지1",
            reviewStarScore: "★★★★★",
            reviewContent: "최근 업데이트가 토스 만의 ux 색깔 개성자체를 잃어버린 것 같습니다. 메인 화면 볼때마다 되게 부드럽고 한눈에 보기 편했는데, 이번 업데이트로 인해 딱딱해진것 같네요. 새로움을 지향하는건 좋으나 이용자들에게 강제가 아닌 선택할 수 있는 옵션이라도 만들어 주셨으면 어떨까요?",
            developerResponse: DeveloperResponse(
                developerResponseContent: "안녕하세요. 김예지 1님, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경 하였습니다만, 고객님처럼 불편하게 느끼셨을 수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다.",
                developerResponseDate: "9월 29일"
            )
        ),
        Review(
            reviewTitle: "홈화면 가독성 떨어짐",
            reviewDate: "9월 27일",
            userName: "김예지2",
            reviewStarScore: "★★★★★",
            reviewContent: "항상 잘 쓰고 있는 토스 앱이지만 이번엔 업데이트하고 나서 앱 열면 뜨는 메인 홈 화면에 어느 은행, 계좌명, 금액 폰트가 너무 작아졌네요. 가독성도 떨어지고 아이콘이랑 폰트가 전체적으로 작아지면서 굳이 폰트 옆으로 공간은 텅 비는데 왜 줄인지 모르겠어요 ... 전보다 너무 크기가 눈에 띄게 작아져서 불편한데 계좌별로 간격도 오히려 더 좁아보이고 금액도 눈에 별로 안띄어요 전 UI가 오히려 나은거 같아요",
            developerResponse: DeveloperResponse(
                developerResponseContent: "안녕하세요. 김예지2님, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경 하였습니다만, 고객님처럼 불편하게 느끼셨을 수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다.",
                developerResponseDate: "9월 29일"
            )
        ),
        Review(
            reviewTitle: "??? 뭐야 내 토스 돌려줘요",
            reviewDate: "9월 29일",
            userName: "김예지3",
            reviewStarScore: "★★★★★",
            reviewContent: "아니 토스없이는 못사는 사람으로 만들어놓고.. 왜 갑자기 이렇게 NO쌈@뽕;;; 한 디자인으로 업데이트어쩌구저쩌구어쩌구저쩌구",
            developerResponse: DeveloperResponse(
                developerResponseContent: "안녕하세요. 김예지3님, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스 화면 UI를 사용자의 요구를 반영해 조금 더 편리하게 사용하도록 변경 하였습니다만, 고객님처럼 불편하게 느끼셨을 수도 있다고 생각합니다. 사용에 불편을 드려 죄송합니다.",
                developerResponseDate: "9월 30일"
            )
        ),
        Review(
            reviewTitle: "다크모드 아이콘",
            reviewDate: "9월 29일",
            userName: "김예지4",
            reviewStarScore: "★★★★★",
            reviewContent: "항상 잘 사용하고 있습니다. 그런데 이번 iOS18에 추가된 다크 모드 아이콘이 토스가 유독 적용이 늦어지고 있어서요. 최근 연례행사로 바쁘신 것도 알지만 사용자 경험을 위해 빠르게 부탁드릴게요. 감사합니다!!",
            developerResponse: DeveloperResponse(
                developerResponseContent: "안녕하세요. 김예지4님, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스앱 이용에 불편을 드려 대단히 죄송합니다. 고객님께서 말씀해주신 내용은 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력 하겠습니다.",
                developerResponseDate: "9월 30일"
            )
        ),
        Review(
            reviewTitle: "마지막리뷰",
            reviewDate: "10월 1일",
            userName: "김예지5",
            reviewStarScore: "★★★★★",
            reviewContent: "마지막,..마지막...마지막...마지막....마지막막막막막막막막막막막..",
            developerResponse: DeveloperResponse(
                developerResponseContent: "안녕하세요. 김예지5님, 토스팀입니다. 소중한 의견을 주셔서 너무나 감사합니다. 토스앱 이용에 불편을 드려 대단히 죄송합니다. 고객님께서 말씀해주신 내용은 팀내에 공유하여 보다 편리한 토스 사용 경험을 하실 수 있도록 노력 하겠습니다.",
                developerResponseDate: "10월 30일"
            )
        ),
    ]
}
