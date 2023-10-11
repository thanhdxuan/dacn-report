= Xác định yêu cầu
== Yêu cầu chức năng
#let func_req = (
  G01: (
    id: "G01",
    feature: "Login", 
    des: "User đăng nhập tài khoản vào hệ thống và được cấp tài nguyên theo vai trò. Ngoài ra còn có chức năng giúp người dùng đặt lại mật khẩu khi quên."
  ),
  G02: (
    id: "G02",
    feature: "Logout", 
    des: "Đăng xuất tài khoản khỏi hệ thống."
  ),
  G03: (
    id: "G03",
    feature: "Manage profile", 
    des: "Người dùng có thể xem/sửa các thông tin cơ bản của tài khoản như tên, email, ảnh đại diện, ..."
  ),
  AL01: (
    id: "AL01",
    feature: "Create new loan", 
    des: "Admin có thể tạo mới đơn vay, bằng cách nhập các thông tin của ứng viên/hồ sơ theo form có sẵn, ứng với các biến trong mô hình dự đoán. Hoặc import dữ liệu từ file csv, json, ..."
  ),
  AL03: (
    id: "AL03",
    feature: "View loan detail", 
    des: "Admin có thể xem thông tin chi tiết của các đơn vay đã tạo."
  ),
  AL04: (
    id: "AL04",
    feature: "Choose model", 
    des: "Admin có thể chọn mô hình dự đoán cho mỗi một đơn vay, các mô hình dự đoán có thể có như: Hồi quy logistic, Random forest, ..."
  ),
  AL05: (
    id: "AL05",
    feature: "View processed loan", 
    des: "Admin có thể xem lại các đơn hàng mình đã xử lý trong quá khứ. Các thông tin hiển thị bao gồm trạng thái (Accepted/Rejected), thời gian xử lý, kết quả dự đoán của mô hình."
  ),
  AL06: (
    id: "AL06",
    feature: "Filter loan", 
    des: "Admin có thể tìm, lọc các đơn dựa trên các tiêu chí khác nhau như: đã xử lý, chưa xử lý, model dự đoán, ..."
  ),
  AL07: (
    id: "AL07",
    feature: "Manage loan",
    des: "Admin có thể xoá/sửa các thông tin của các đơn vay chưa được xử lý như chỉnh sửa thông tin của các biến, chỉnh sửa mô hình dự đoán."
  ),
  S01: (
    id: "S01",
    feature: "Notification",
    des: "Hệ thống xử lý, hiển thị thông báo mới hoặc gửi email/sms cho người dùng mỗi khi có cập nhật về đơn vay hoặc các cập nhật khác."
  ),
  S02: (
    id: "S02",
    feature: "Model selection",
    des: "Hệ thống phải có ít nhất 2 mô hình dự đoán cho người dùng lựa chọn."
  )
)

#let nonfunc_req = (
  SE01: (
    id: "SE01",
    feature: "Strong password",
    des: "Mật khẩu của mỗi tài khoản được yêu cầu phải ít nhất 8 ký tự, bao gồm chữ cái in hoa và in thường, số và ký tự đặc biệt."
  ),
  SE02: (
    id: "SE02",
    feature: "Auto block",
    des: "Trong trường hợp người dùng đăng nhập thất bại 5 lần liên tiếp, hệ thống sẽ tự động khoá tài khoản, để mở khoá tài khoản, người dùng cần liên hệ với quản trị viên."
  ),
  SE03: (
    id: "SE03",
    feature: "Secure website",
    des: "Trang web sử dụng một số giao thức bảo mật trên mạng như TSL, SSL, JWT (Json Web Token) để bảo mật cho website."
  ),
  ES01: (
    id: "ES01",
    feature: "Provide clear interface",
    des: "Giao diện đẹp, rõ ràng, đảm bảo người dùng có thể tập trung vào những thông tin quan trọng, làm nổi bật những chỉ số, thông tin quan trọng bằng cách hightlight, ..."
  ),
  ES02: (
    id: "ES02",
    feature: "Support multi platform",
    des: "Trang web hỗ trợ giao diện responsive (tự động thay đổi các thông số về giao diện để phù hợp với kích thước màn hình) và đảm bảo tương thích trên nhiều hệ điều hành (iOS, Android, ...), trình duyệt khác nhau (Firefox, Chrome, MS Edge, ...)"
  ),
  ES03: (
    id: "ES03",
    feature: "Support multi language",
    des: "Trang web hỗ trợ 2 ngôn ngữ: tiếng Anh và tiếng Việt"
  ),
  ES04: (
    id: "ES04",
    feature: "Provide clear feature",
    des: "Trang web cung cấp các tính năng đơn giản, dễ thao tác, đảm bảo người dùng có thể thực hiện thành thạo sau 1 lần hướng dẫn" 
  ),
  PE01: (
    id: "PE01",
    feature: "",
    des: "Các tác vụ xử lý dữ liệu (tính toán, dự đoán) yêu cầu trả kết quả trong vòng không quá 1 giây."
  ),
  RE01: (
    id: "RE01",
    feature: "Auditing",
    des: "Hệ thống ghi lại logs khi có sự thay đổi tác động lên hệ thống hằng ngày."
  )
)
*YÊU CẦU CHUNG*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  func_req.G01.id, func_req.G01.feature, func_req.G01.des,
  func_req.G02.id, func_req.G02.feature, func_req.G02.des,
  func_req.G03.id, func_req.G03.feature, func_req.G03.des,
)

*HỆ THỐNG*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  func_req.S01.id, func_req.S01.feature, func_req.S01.des,
  func_req.S02.id, func_req.S02.feature, func_req.S02.des
)

*DỰ ĐOÁN ĐƠN VAY*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  func_req.AL01.id, func_req.AL01.feature, func_req.AL01.des,
  func_req.AL03.id, func_req.AL03.feature, func_req.AL03.des,
  func_req.AL04.id, func_req.AL04.feature, func_req.AL04.des,
  func_req.AL05.id, func_req.AL05.feature, func_req.AL05.des,
  func_req.AL06.id, func_req.AL06.feature, func_req.AL06.des,
  func_req.AL07.id, func_req.AL07.feature, func_req.AL07.des
)

== Yêu cầu phi chức năng
*HIỆU SUẤT*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  nonfunc_req.PE01.id, nonfunc_req.PE01.feature, nonfunc_req.PE01.des,
)
*TÍNH TIN CẬY*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  nonfunc_req.RE01.id, nonfunc_req.RE01.feature, nonfunc_req.RE01.des,
)
*THÂN THIỆN VỚI NGƯỜI DÙNG*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  nonfunc_req.ES01.id, nonfunc_req.ES01.feature, nonfunc_req.ES01.des,
  nonfunc_req.ES02.id, nonfunc_req.ES02.feature, nonfunc_req.ES02.des,
  nonfunc_req.ES03.id, nonfunc_req.ES03.feature, nonfunc_req.ES03.des,
  nonfunc_req.ES04.id, nonfunc_req.ES04.feature, nonfunc_req.ES04.des
)
*BẢO MẬT*
#table(
  columns: (0.5fr, 1fr, 3fr),
  inset: 10pt,
  align: horizon,
  [*ID*], [*Feature*], [*Description*],
  nonfunc_req.SE01.id, nonfunc_req.SE01.feature, nonfunc_req.SE01.des,
  nonfunc_req.SE02.id, nonfunc_req.SE02.feature, nonfunc_req.SE02.des,
  nonfunc_req.SE03.id, nonfunc_req.SE03.feature, nonfunc_req.SE03.des
)

#pagebreak()