= Những góp ý của hội đồng báo cáo đồ án chuyên ngành
== Xác định nhóm người dùng ứng dụng
_Vấn đề:_ Cần xác định nhóm người dùng cuối của hệ thống, có thể (Trong báo cáo chỉ xác định là nhà quản lý ngân hàng).

_Đề xuất của nhóm:_
Với những đặc tả của hệ thống hiện tại, nhóm người dùng hệ thống phải là những quản lý cấp cao, có khả năng sử dụng các chức năng của hệ thống để đánh giá, phân tích dựa trên các thông tin mà hệ thống cung cấp, từ đó tham khảo và có thể đưa ra những quyết định liên quan đến việc vay vốn ngân hàng.

== Xác thực thông tin giấy tờ người dùng cung cấp
_Vấn đề:_ Làm sao để xác thực các thông tin, giấy tờ của người dùng cung cấp cho hệ thống? Quy trình xác thực bao gồm những quy định nào, thông qua những đơn vị (hoặc bộ phận nào)?

_Đề xuất của nhóm:_
Các thông tin cần xác định khi vay vốn có thể chia thông tin khách hàng khi vay vốn thành 3 nhóm chính @Quytrinh_2023:

- Thông tin cá nhân: bao gồm họ tên, ngày tháng năm sinh, giới tính, địa chỉ thường trú, số chứng minh nhân dân/căn cước công dân, số điện thoại, email,...
- Thông tin tài chính: bao gồm thu nhập, chi phí, lịch sử tín dụng,...
- Thông tin về mục đích vay vốn: bao gồm mục đích vay vốn, số tiền vay, thời hạn vay,...
Thông tin khách hàng có thể được xác định thông qua các phương pháp sau:

- Trao đổi trực tiếp với khách hàng: Đây là phương pháp truyền thống và phổ biến nhất. Cán bộ ngân hàng sẽ trao đổi trực tiếp với khách hàng để thu thập thông tin.
- Nhận hồ sơ vay vốn: Hồ sơ vay vốn thường bao gồm các giấy tờ chứng minh thông tin cá nhân, tài chính và mục đích vay vốn của khách hàng.
- Thẩm định tín dụng: Thẩm định tín dụng là quá trình ngân hàng đánh giá khả năng vay vốn và khả năng trả nợ của khách hàng. Quá trình này thường bao gồm việc thu thập thông tin từ các nguồn khác nhau, chẳng hạn như cơ quan tín dụng quốc gia, cơ quan thuế,...

Về việc thẩm định hồ sơ, có thể sử dụng các phương pháp:
- Thẩm định thực tế: Đây là phương pháp thẩm định phổ biến nhất. Cán bộ thẩm định của ngân hàng sẽ trực tiếp đến kiểm tra thực tế tài sản thế chấp để xác định giá trị và khả năng thanh khoản của tài sản.
- Thẩm định giá: Ngân hàng sẽ thuê một công ty thẩm định giá chuyên nghiệp để thẩm định giá tài sản thế chấp.
- Thẩm định qua hồ sơ: Ngân hàng sẽ thẩm định tài sản thế chấp dựa trên hồ sơ pháp lý và tài liệu liên quan.


_Vì vậy_, việc thẩm định các thông tin mà khách hàng cung cấp đòi hỏi một đội ngũ có chuyên môn về tài chính, định giá. Do đó, nhóm đề xuất các thông tin về hồ sơ sẽ phải được các nhà quản lý ngân hàng chuyển cho đội ngũ thẩm định, từ đó có thể xác thực được thông tin mà khách hàng cung cấp trước khi sử dụng các chức năng của bộ công cụ.


== Xác định vai trò của mình và người dùng trong hệ thống
_Vấn đề:_ Trong sơ đồ use-case của nhóm chưa thể hiện được vai trò của mình trong hệ thống, với sơ đồ này, chỉ thể hiện mình là nhóm phát triển hệ thống và không thể can thiệp vào hệ thống.

#sym.arrow.r.double
Dẫn đến khó khăn trong việc cung cấp ứng dụng đến người dùng cũng như xử lý lỗi hệ thống phát sinh trong quá trình sử dụng.

_Đề xuất của nhóm:_ 