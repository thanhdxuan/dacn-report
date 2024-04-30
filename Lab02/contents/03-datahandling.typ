#pagebreak()
#set enum(numbering: "a)")
= *Hashing*
== Câu 1: Hàm một chiều (one-way function) là gì?
Hàm một chiều là hàm mà rất dễ mã hóa nhưng không giải mã được, ta không thể tính lại được bản gốc khi có bản mã. 

== Câu 2: Cho một ví dụ để minh hoạ việc sử dụng hàm băm có thể giúp kiểm tra tính toàn vẹn của thông điệp.
_Gợi ý: mã hoá thông điệp, tạo ra thay đổi trên ciphertext và sử dụng hàm băm để kiểm tra thông điệp được giải mã có thay đổi so với thông điệp gốc ban đầu._

Có thể dùng hàm băm để tạo chữ kí số giúp xác thực tính toàn vẹn của thông điệp cũng như xác minh được người gửi. 
Ví dụ với việc gửi thông điệp M.
Bên gửi: sẽ gửi dùng hàm Hash để tính h = Hash(M), sau đó lấy h đi mã hóa bằng khóa riêng người gửi để được chữ ký số S. Người gửi sẽ gửi cả M và S.

Bên nhân: lấy ra M và tính h = Hash(M), sau đó sẽ lấy khóa công khai người gửi để giải mã S ta được h'. Cuối cùng so trùng h = h' để xem tính toàn vẹn của dữ liệu.

== Câu 3: Hàm băm H(·) là hàm có chức năng chuyển thông điệp có kích thước bất kì bất kỳ về kích thước cố định:

+ Xem xét giá trị hash được tạo ra bằng cách áp dụng giải thuật hash SHA-1 trên một ký tự trong bảng chữ cái tiếng Anh: C6 3A E6 DD 4F C9 F9 DD A6 69 70 E8 27 D1 3F 7C 73 FE 84 1C. Hãy tìm ký tự chữ cái tiếng anh được sử dụng và mô tả cách làm? (dùng công cụ CrypTool)

  - Bước 1: Mở công cụ, và chọn vào phần Hash Functions, và chọn giải thuật *SHA1*
  - Bước 2: Tạo input stream và output stream cho giải thuật
  - Bước 3: Nhập các ký tự cần thử để dùng giải thuật hashing và nhấn Play
  - Bước 4: Ta theo dõi kết quả ở ouput stream
  #image("/images/2c3_1.jpeg", width: 100%)

+ Giả sử bạn đã tìm ra được ký tự ở câu a, như vậy có thể kết luận hàm hash SHA-1 không thoả mãn tính chất một chiều (one-way) được hay không, giải thích câu trả lời? 
  SHA-1 vẫn thỏa mãn tính chất một chiều, chúng ta tìm được ký tự ban đầu dựa vào phép thử, và nếu message trở nên lớn hơn, rất khó để tìm ra được giá trị hash.

== Câu 4: Thực hiện lại bước 3 cho các giải thuật hash khác và đánh giá giá trị hash nhận được với giá trị hash ban đầu.

Ta cùng sử dụng plaintext $M = "Thanh"$ cho các giải thuật dưới đây.

=== Giải thuật SHA-256
#image("/images/2c4_1.jpg", width: 100%)

*Kết quả:* `73 E2 F4 3E 09 6D A9 DE 12 6A 91 19 FD F7 D2 CD 9B 02 1A D2 A4 3F 6A 42 69 1B E5 62 2B BC 67 BB` 
=== Giải thuật SHA-512
#image("/images/2c4_2.jpeg", width: 100%)
*Kết quả:* `76 A1 70 26 C7 3E FF 56 65 D2 D8 83 CE 0B 5A CD A6 82 A8 84 3F C2 14 E1 9C 75 41 09 E6 BB 41 E0 1D 6C 78 DC E5 B2 3A 4C 4B 16 06 8D EE B4 91 33 40 7C EC 36 A9 65 DB E3 A7 4D 69 CC 87 A5 22 EF` 
=== Giải thuật MD-5
#image("/images/2C4_3.jpeg", width: 100%)

*Kết quả:* `EA CD 47 8A ED C7 98 62 23 48 F9 FF D7 5E 23 AC`
=== Giải thuật CRC
#image("/images/2c4_4.jpeg", width: 100%) 
*Kết quả:* ```04 21 4F AE```
