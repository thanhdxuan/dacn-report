
= Use-case diagram
== Use-case diagram toàn hệ thống
#block(
   width: 100%,
   inset: 10pt,
   radius: 3pt,
   stroke: rgb(87, 127, 230),
   fill: rgb(87, 127, 230, 40),
   par(
      justify: true,
      "Xem chi tiết sơ đồ use-case của nhóm tại: " + link("https://drive.google.com/file/d/1EtNV2Po7mtwW4zg2rioz8HqAY8JeO-W2/view?usp=sharing")
   )
)
#figure(
  image("..\images\DACN-Whole-system.jpg", width: 100%),
  caption: [
    Sơ đồ use-case cho toàn hệ thống.
  ],
)
#pagebreak()
== Use-case diagram và đặc tả cho QUẢN LÝ ĐƠN VAY
#figure(
  image("..\images\DACN-manage-loan.jpg", width: 100%),
  caption: [
    Sơ đồ use-case cho tính năng QUẢN LÝ ĐƠN VAY.
  ],
)
#let use-case-header = (
   "Use-case Name", "Actors", "Description", "Trigger", "Pre-Conditions", "Post-Conditions", "Normal Flow", "Alternative Flow", "Exeption Flow", "Constraints"
)
#let use-cases = (
   new-: (
      name: "Tạo đơn vay mới",
      actor: "",
      des: "",
      trigger: "",
      preconds: "",
      postconds: "",
      norflow: "",
      alterflow: "",
      exceptflow: "",
      constraint: ""
   ),
   new-loan: (
      name: "Tạo đơn vay mới",
      actor: "Admin",
      des: "Admin tạo một đơn xin vay vốn mới dựa trên hồ sơ người dùng làm tại ngân hàng.",
      trigger: "Admin chọn vào button 'Tạo đơn mới' trong menu 'Quản lý đơn vay'.",
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
      ],
      postconds: "Dữ liệu về đơn vay mới do admin thực hiện các thao tác được cập nhật vào trong cơ sở dữ liệu và hiển thị vào danh mục 'Đơn chưa được xử lý'",
      norflow: [
         + Admin chọn mục ' Tạo đơn mới ' trong menu 'Quản lý đơn vay'.
         + Hệ thống mở cửa sổ 'Tạo đơn mới' bao gồm biểu mẫu yêu cầu nhập các thông tin cần thiết.
         + Admin nhập các thông tin cần thiết vào biểu mẫu và nhấn 'Tạo'.
         + Hệ thống xác nhận và thực hiện thêm thông tin của đơn mới vào cơ sở dữ liệu, đồng thời sử dụng model mà admin đã chọn để thực hiện dự đoán dựa trên các thông tin được cung cấp.
         + Hệ thống thông báo tạo đơn mới thành công.
      ],
      alterflow: "Không có",
      exceptflow: [
         *E1: Tại bước 2* \
         2.1 Admin nhấn vào button 'Huỷ'. \
         2.2 Hệ thống ẩn biểu mẫu tạo đơn mới. \
         *E2: Tại bước 4* \
         4.1 Hệ thống xác định Admin chưa chọn loại mô hình để thực hiện dự đoán / Chưa nhập đủ các thông tin bắt buộc. \
         4.2 Hệ thống hiển thị warning và yêu cầu Admin thực hiện đủ các bước. \
      ],
      constraint: [
         Đơn mới tạo phải được nằm đầu tiên trong danh sách các đơn chưa xử lý.
      ]
   ),
   manage-unprocessed-loan: (
      name: "Quản lý các đơn chưa xử lý",
      actor: "Admin",
      des: "Là một Admin, sẽ muốn xem xét các đơn đã tạo nhưng chưa được xử lý, từ đó có thể dễ dàng quản lý các đơn mới.",
      trigger: "Admin chọn vào tab 'Đơn chưa xử lý' trong menu 'Quản lý đơn vay'.",
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
      ],
      postconds: [
         Admin xem được thông tin của các đơn vay hiện có trong hệ thống tuy nhiên chưa được xử lý.
      ],
      norflow: [
         + Admin chọn mục "Đơn chưa xử lý" trong menu "Quản lý đơn vay".
         + Hệ thống hiển thị danh sách các đơn vay có trong hệ thống nhưng có trạng thái "Chưa được xử lý", được sắp xếp theo ngày tạo đơn. \ Mỗi đơn, ngoài các thông tin cơ bản, hệ thống hiển thị các thông tin quan trọng như trạng thái, ngày tạo, kết quả dự đoán của mô hình.
      ],
      alterflow: [Không có],
      exceptflow: [Không có],
      constraint: [Không có]
   ),
   processing-loan: (
      name: "Xử lý đơn",
      actor: "Admin",
      des: "Admin xử lý các đơn vay (Chấp nhận cho vay / Không chấp nhận)",
      trigger: [
         Admin chọn vào button "Xử lý" trong mỗi đơn vay chưa được xử lý trong tab "Đơn chưa xử lý" trong menu "Quản lý đơn vay".
      ],
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
      ],
      postconds: [
         - Admin xử lý thành công đơn vay, trạng thái đơn vay thay đổi từ "Chưa được xử lý" thành "Được chấp nhận" hoặc "Bị từ chối"
         - Dữ liệu được cập nhật vào cơ sở dữ liệu.
         - Đơn vay chuyển từ tab "Đơn chưa xử lý" sang tab "Đơn đã xử lý".
      ],
      norflow: [
         + Admin nhấn vào button "Xử lý" của đơn vay bất kỳ trong danh sách được hiển thị trong tab "Đơn chưa xử lý".
         + Hệ thống hiển thị cửa sổ "Xử lý đơn + ID đơn" và hiển thị các thông tin cơ bản của đơn.
         + Admin chọn vào button "Chấp nhận" hoặc "Từ chối" trong cửa sổ
         + Hệ thống hiển thị thông báo xử lý đơn thành công.
      ],
      alterflow: [
         *A2: Tại bước 2* \
         2.1. Admin chọn button "Đổi mô hình dự đoán".\
         2.2. Hệ thống hiển thị các mô hình hiện có.\
         2.3. Admin chọn mô hình mong muốn.\
         2.4. Hệ thống tính toán, gửi kết quả dự đoán trở lại màn hình.\
      ],
      exceptflow: [
         *E1: Admin nhấn vào nút "Huỷ"* \
         Hệ thống ẩn cửa sổ đi, và trở lại giao diện của tab "Đơn chưa xử lý".
      ],
      constraint: [
         - Các đơn mới được xử lý sẽ được xuất hiện ở đầu của tab "Đơn đã xử lý".
      ]
   ),
)
*TẠO ĐƠN VAY MỚI*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.new-loan.name,
  use-case-header.at(1), use-cases.new-loan.actor,
  use-case-header.at(2), use-cases.new-loan.des,
  use-case-header.at(3), use-cases.new-loan.trigger,
  use-case-header.at(4), use-cases.new-loan.preconds,
  use-case-header.at(5), use-cases.new-loan.postconds,
  use-case-header.at(6), use-cases.new-loan.norflow,
  use-case-header.at(7), use-cases.new-loan.alterflow,
  use-case-header.at(8), use-cases.new-loan.exceptflow,
  use-case-header.at(9), use-cases.new-loan.constraint,
)
*QUẢN LÝ CÁC ĐƠN CHƯA XỬ LÝ*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.manage-unprocessed-loan.name,
  use-case-header.at(1), use-cases.manage-unprocessed-loan.actor,
  use-case-header.at(2), use-cases.manage-unprocessed-loan.des,
  use-case-header.at(3), use-cases.manage-unprocessed-loan.trigger,
  use-case-header.at(4), use-cases.manage-unprocessed-loan.preconds,
  use-case-header.at(5), use-cases.manage-unprocessed-loan.postconds,
  use-case-header.at(6), use-cases.manage-unprocessed-loan.norflow,
  use-case-header.at(7), use-cases.manage-unprocessed-loan.alterflow,
  use-case-header.at(8), use-cases.manage-unprocessed-loan.exceptflow,
  use-case-header.at(9), use-cases.manage-unprocessed-loan.constraint,
)

*XỬ LÝ ĐƠN*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.processing-loan.name,
  use-case-header.at(1), use-cases.processing-loan.actor,
  use-case-header.at(2), use-cases.processing-loan.des,
  use-case-header.at(3), use-cases.processing-loan.trigger,
  use-case-header.at(4), use-cases.processing-loan.preconds,
  use-case-header.at(5), use-cases.processing-loan.postconds,
  use-case-header.at(6), use-cases.processing-loan.norflow,
  use-case-header.at(7), use-cases.processing-loan.alterflow,
  use-case-header.at(8), use-cases.processing-loan.exceptflow,
  use-case-header.at(9), use-cases.processing-loan.constraint,
)

*UPDATING ...*