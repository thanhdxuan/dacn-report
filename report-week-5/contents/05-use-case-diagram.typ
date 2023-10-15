
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
      trigger: "Admin chọn vào nút 'Tạo đơn mới' trong menu 'Quản lý đơn vay'.",
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
      ],
      postconds: "Dữ liệu về đơn vay mới do admin thực hiện các thao tác được cập nhật vào trong cơ sở dữ liệu và hiển thị vào danh mục 'Đơn chưa được xử lý'",
      norflow: [
         + Admin chọn mục ' Tạo đơn mới ' trong menu 'Quản lý đơn vay'.
         + Hệ thống mở cửa sổ 'Tạo đơn mới' bao gồm biểu mẫu yêu cầu nhập các thông tin cần thiết.
         + Admin nhập các thông tin cần thiết vào biểu mẫu và nhấn 'Tạo'.
         // + Hệ thống xác nhận và thực hiện thêm thông tin của đơn mới vào cơ sở dữ liệu, đồng thời sử dụng model mà admin đã chọn để thực hiện dự đoán dựa trên các thông tin được cung cấp.
         + Hệ thống xác nhận và thực hiện thêm thông tin của đơn mới vào cơ sở dữ liệu.
         + Hệ thống thông báo tạo đơn mới thành công.
      ],
      alterflow: "Không có",
      exceptflow: [
         *E1: Tại bước 2* \
         2.1 Admin nhấn vào nút 'Huỷ'. \
         2.2 Hệ thống ẩn biểu mẫu tạo đơn mới. \
         // *E2: Tại bước 4* \
         // 4.1 Hệ thống xác định Admin chưa chọn loại mô hình để thực hiện dự đoán / Chưa nhập đủ các thông tin bắt buộc. \
         // 4.2 Hệ thống hiển thị warning và yêu cầu Admin thực hiện đủ các bước. \
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
         + Hệ thống hiển thị danh sách các đơn vay có trong hệ thống nhưng có trạng thái "Chưa được xử lý", được sắp xếp theo ngày tạo đơn. \ Mỗi đơn, ngoài các thông tin cơ bản, hệ thống hiển thị các thông tin quan trọng như trạng thái, ngày tạo, kết quả dự đoán tốt nhất của các mô hình.
      ],
      alterflow: [Không có],
      exceptflow: [Không có],
      constraint: [Không có]
   ),

   detail_information: (
      name: "Xem thông tin chi tiết",
      actor: "Admin",
      des: "Admin muốn xem thông tin chi tiết của từng đơn vay",
      trigger: [
         - Admin chọn vào đơn muốn xem chi tiết.
      ],
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
         - Có tồn tại đơn vay trong giao diện.
      ],
      postconds: [
         - Admin thấy được thông tin chi tiết của đơn.
      ],
      norflow: [
         + Admin nhấn vào đơn vay tương ứng.
         + Một cửa sổ có kích thước khoảng 1/4 màn hình xuất hiện ở bên phải màn hình hiện tại.
         + Trang cửa sổ hiển thị tất cả thông tin chi tiết của đơn vay và kết quả đánh giá từ mô hình (mặc định là mô hình có kết quả đánh giá tốt nhất).
      ],
      alterflow: [Không có],
      exceptflow: [
         *E1: Admin nhấn vào nút "Huỷ"* \
         Hệ thống ẩn cửa sổ đi, và trở lại giao diện của tab "Đơn chưa xử lý".
      ],
      constraint: [Không có],
   ),

   processing-loan: (
      name: "Xử lý đơn",
      actor: "Admin",
      des: "Admin xử lý các đơn vay (Chấp nhận cho vay / Không chấp nhận)",
      trigger: [
         // Admin chọn vào nút "Xử lý" trong mỗi đơn vay chưa được xử lý trong tab "Đơn chưa xử lý" trong menu "Quản lý đơn vay".
         Admin nhấp chọn nút "Chấp nhận" hoặc "Từ chối".
      ],
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
         - Có tồn tại đơn trong giao diện.
         - Admin đã bấm vào để xem thông tin chi tiết của đơn vay.
      ],
      postconds: [
         - Admin xử lý thành công đơn vay, trạng thái đơn vay thay đổi từ "Chưa được xử lý" thành "Đợi kết quả" hoặc "Bị từ chối"
         - Dữ liệu được cập nhật vào cơ sở dữ liệu.
         - Đơn vay chuyển từ tab "Đơn chưa xử lý" sang tab "Đơn đã xử lý".
      ],
      norflow: [
         // + Admin nhấn vào nút "Xử lý" của đơn vay bất kỳ trong danh sách được hiển thị trong tab "Đơn chưa xử lý".
         + Admin chọn vào nút "Chấp nhận" hoặc "Từ chối" trong cửa sổ.
         + Hệ thống hiển thị pop-up xác nhận.
         + Admin chọn vào nút "Chấp nhận".
         + Hệ thống hiển thị thông báo xử lý đơn thành công.
      ],
      alterflow: [
         *A1: Tại bước 1* \
         1.1. Admin chọn nút "Chấp nhận".\
         1.2. Đơn được chuyển trạng thái thành "Waiting".\

         *A2: Tại bước 1* \
         1.1. Admin chọn nút "Từ chối".\
         1.2. Đơn được chuyển trạng thái thành "Canceled".\
      ],
      exceptflow: [
         *E1: Admin nhấn vào nút "Huỷ"* \
         Hệ thống ẩn cửa sổ đi, và trở lại giao diện của tab "Đơn chưa xử lý".
      ],
      constraint: [
         - Các đơn mới được xử lý sẽ được xuất hiện ở đầu của tab "Đơn đã xử lý".
      ]
   ),

   choose_model: (
      name: "Chọn mô hình dự đoán",
      actor: "Admin",
      des: "Admin muốn thay đổi giữa các mô hình để quan sát được các dự đoán, kết quả đánh giá khác nhau.",
      trigger: [
         - Admin chọn vào nút "Đổi mô hình dự đoán",
      ],
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
         - Có tồn tại đơn vay trong giao diện.
         - Admin đã bấm vào để xem thông tin chi tiết của đơn vay.
      ],
      postconds: [
         - Admin quan sát được kết quả từ các mô hình khác nhau.
      ],
      norflow: [
         + Admin chọn nút "Đổi mô hình dự đoán".
         + Hệ thống hiển thị các mô hình hiện có.
         + Admin chọn mô hình mong muốn.
         + Hệ thống tính toán, gửi kết quả dự đoán trở lại màn hình.
      ],
      alterflow: [Không có],
      exceptflow: [
         *E1: Admin nhấn vào nút "Huỷ"* \
         Hệ thống ẩn cửa sổ đi, và trở lại giao diện của tab "Đơn chưa xử lý".
      ],
      constraint: [Không có],
   ),

   filter: (
      name: "Lọc đơn",
      actor: "Admin",
      des: "Admin muốn lọc các đơn vay theo những từ khóa",
      trigger: [
         - Admin chọn những bộ lọc có sẵn và chọn nút "Apply",
      ],
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
      ],
      postconds: [
         - Các đơn tương ứng với những từ khóa đã chọn sẽ được hiển thị.
      ],
      norflow: [
         + Admin chọn vào nút "Filter".
         + Admin nhấp chọn những bộ lọc tương ứng.
         + Admin nhấn nút "Apply".
         + Danh sách các đơn liên quan được hiển thị.
      ],
      alterflow: [
         *A1: Tại bước 4* \
         1.1. Nếu không có đơn ứng với những từ khóa đã chọn. \
         1.2. Giao diện hiện dòng chữ "Không có đơn vay nào liên quan".
      ],
      exceptflow: [Không có],
      constraint: [Không có],
   ),

   delete: (
      name: "Xóa đơn vay vốn",
      actor: "Admin",
      des: "Admin muốn xóa đơn vay vốn.",
      trigger: [
         - Admin chọn vào nút "Xóa".
      ],
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
         - Có tồn tại đơn vay trong giao diện.
         - Admin đã bấm vào để xem thông tin chi tiết của đơn vay.
      ],
      postconds: [
         - Đơn vay bị xóa khỏi cơ sở dữ liệu.
      ],
      norflow: [
         + Admin chọn nút "Xóa".
         + Hệ thống hiển thị pop-up xác nhận.
         + Admin chọn nút "Chấp nhận".
         + Đơn vay bị xóa khỏi cơ sở dữ liệu và trở lại giao diện của tab "Đơn chưa xử lý".
      ],
      alterflow: [Không có],
      exceptflow: [
         *E1: Admin nhấn vào nút "Huỷ"* \
         Hệ thống ẩn cửa sổ đi, và trở lại giao diện của tab "Đơn chưa xử lý".
      ],
      constraint: [Không có],
   ),

   manage_processed_loan: (
      name: "Quản lý các đơn đã xử lý",
      actor: "Admin",
      des: "Là một Admin, sẽ muốn xem xét các đơn đã được được xử lý, từ đó có thể quản lý kết quả trả về của các đơn đã được chấp nhận.",
      trigger: "Admin chọn vào tab 'Đơn đã xử lý' trong menu 'Quản lý đơn vay'.",
      preconds: [
         - Admin đã đăng nhập thành công vào hệ thống và có quyền truy cập chức năng "Quản lý đơn vay".
      ],
      postconds: [
         Admin xem được tình trạng các đơn vay vốn đã xử lý.
      ],
      norflow: [
         + Admin chọn mục "Đơn đã xử lý" trong menu "Quản lý đơn vay".
         + Hệ thống hiển thị danh sách các đơn vay có trong hệ thống nhưng có trạng thái "Đã được xử lý", được sắp xếp theo ngày xử lý. \ Mỗi đơn, ngoài các thông tin cơ bản, hệ thống hiển thị các thông tin quan trọng như trạng thái, ngày tạo, kết quả dự đoán tốt nhất của các mô hình.
         + Đối với những đơn có trạng thái là "Waiting" thì admin sẽ có 2 lựa chọn là "Chấp nhận" hoặc "Từ chối" để đưa đơn vào mô hình cho việc đào tạo.
      ],
      alterflow: [
         *A1: Tại bước 3* \
         1.1. Admin chọn nút "Chấp nhận".\
         1.2. Hệ thống hiển thị pop-up xác nhận.\
         1.3. Admin chọn nút "Chấp nhận".\
         1.4. Dữ liệu được đưa vào mô hình để đào tạo và đơn chuyển sang trạng thái Finished/Canceled.\
         *A2: Tại bước 3* \
         2.1. Admin chọn nút "Từ chối".\
         2.2. Hệ thống hiển thị pop-up xác nhận.\
         2.3. Admin chọn nút "Chấp nhận".\
         2.4. Đơn chuyển sang trạng thái Finished/Canceled.\
      ],
      exceptflow: [Không có],
      constraint: [Không có]
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
)\

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
)\

*XEM THÔNG TIN CHI TIẾT*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.detail_information.name,
  use-case-header.at(1), use-cases.detail_information.actor,
  use-case-header.at(2), use-cases.detail_information.des,
  use-case-header.at(3), use-cases.detail_information.trigger,
  use-case-header.at(4), use-cases.detail_information.preconds,
  use-case-header.at(5), use-cases.detail_information.postconds,
  use-case-header.at(6), use-cases.detail_information.norflow,
  use-case-header.at(7), use-cases.detail_information.alterflow,
  use-case-header.at(8), use-cases.detail_information.exceptflow,
  use-case-header.at(9), use-cases.detail_information.constraint,
)\

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
)\

*CHỌN MÔ HÌNH DỰ ĐOÁN*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.choose_model.name,
  use-case-header.at(1), use-cases.choose_model.actor,
  use-case-header.at(2), use-cases.choose_model.des,
  use-case-header.at(3), use-cases.choose_model.trigger,
  use-case-header.at(4), use-cases.choose_model.preconds,
  use-case-header.at(5), use-cases.choose_model.postconds,
  use-case-header.at(6), use-cases.choose_model.norflow,
  use-case-header.at(7), use-cases.choose_model.alterflow,
  use-case-header.at(8), use-cases.choose_model.exceptflow,
  use-case-header.at(9), use-cases.filter.constraint,
)\
\
\
*LỌC ĐƠN*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.filter.name,
  use-case-header.at(1), use-cases.filter.actor,
  use-case-header.at(2), use-cases.filter.des,
  use-case-header.at(3), use-cases.filter.trigger,
  use-case-header.at(4), use-cases.filter.preconds,
  use-case-header.at(5), use-cases.filter.postconds,
  use-case-header.at(6), use-cases.filter.norflow,
  use-case-header.at(7), use-cases.filter.alterflow,
  use-case-header.at(8), use-cases.filter.exceptflow,
  use-case-header.at(9), use-cases.filter.constraint,
)\

*XÓA ĐƠN*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.delete.name,
  use-case-header.at(1), use-cases.delete.actor,
  use-case-header.at(2), use-cases.delete.des,
  use-case-header.at(3), use-cases.delete.trigger,
  use-case-header.at(4), use-cases.delete.preconds,
  use-case-header.at(5), use-cases.delete.postconds,
  use-case-header.at(6), use-cases.delete.norflow,
  use-case-header.at(7), use-cases.delete.alterflow,
  use-case-header.at(8), use-cases.delete.exceptflow,
  use-case-header.at(9), use-cases.delete.constraint,
)\

// *GỬI CẬP NHẬT ĐƠN*
// #table(
//   columns: (0.5fr, 2fr),
//   inset: 10pt,
//   align: horizon,
//   use-case-header.at(0), use-cases.processing-loan.name,
//   use-case-header.at(1), use-cases.processing-loan.actor,
//   use-case-header.at(2), use-cases.processing-loan.des,
//   use-case-header.at(3), use-cases.processing-loan.trigger,
//   use-case-header.at(4), use-cases.processing-loan.preconds,
//   use-case-header.at(5), use-cases.processing-loan.postconds,
//   use-case-header.at(6), use-cases.processing-loan.norflow,
//   use-case-header.at(7), use-cases.processing-loan.alterflow,
//   use-case-header.at(8), use-cases.processing-loan.exceptflow,
//   use-case-header.at(9), use-cases.processing-loan.constraint,
// )

*QUẢN LÝ CÁC ĐƠN ĐÃ XỬ LÝ*
#table(
  columns: (0.5fr, 2fr),
  inset: 10pt,
  align: horizon,
  use-case-header.at(0), use-cases.manage_processed_loan.name,
  use-case-header.at(1), use-cases.manage_processed_loan.actor,
  use-case-header.at(2), use-cases.manage_processed_loan.des,
  use-case-header.at(3), use-cases.manage_processed_loan.trigger,
  use-case-header.at(4), use-cases.manage_processed_loan.preconds,
  use-case-header.at(5), use-cases.manage_processed_loan.postconds,
  use-case-header.at(6), use-cases.manage_processed_loan.norflow,
  use-case-header.at(7), use-cases.manage_processed_loan.alterflow,
  use-case-header.at(8), use-cases.manage_processed_loan.exceptflow,
  use-case-header.at(9), use-cases.manage_processed_loan.constraint,
)\

*UPDATING ...*