#pagebreak()
= Chữ ký số

== Câu 1: Mô phỏng chữ ký số bằng chương trình Cryptool, thực hiện theo các bước như hướng dẫn tham khảo bên dưới, với đầu vào là tập tin msg.txt chứa thông tên đầy đủ và mã số sinh viên. Chụp ảnh màn hình từng bước như phần tham khảo.

_Ví dụ: sinh viên có tên Nguyễn Văn An và MSSV là 123456789, tập tin msg.txt có nội dung như sau:_
```
Ten: Nguyen Van An
MSSV: 123456789
Lab 04 Digital Signature
```
- Bước 1: Từ giao diện của chương trình Cryptool, chọn menu “Digital Signatures/PKI” 🡪 “Signature Demonstration (Signature Generation)”
#image("/images/dig_b1.jpg")

#pagebreak()
- Bước 2: Chọn “Select hash function”.  Chọn MD5 (hoặc một giải thuật hash khác) và nhấn OK.
#image("/images/dig_b2.jpg")

#pagebreak()
- Chọn “Generate Key” và “Generate prime numbers” trong hộp thoại step by step Signature Generation
#image("/images/dig_b3.png")

#pagebreak()
- Nhập cân dưới: 2^150 và cận trên: 2^151.  Sau đó nhấn nút Generate prime numbers và apply primes.

#image("/images/dig_b4.jpg")
#pagebreak()
- Nhấn nút Store key

#image("/images/dig_b5.jpg")
#pagebreak()
- Nhấn nút Provide certificate, nhập vào
	- Name (nhập thông tin họ và chữ lót của sinh viên): Smith
	- First name (nhập tên của sinh viên): Mary
	- Key identifier (<tên> key): Mary key
	- PIN: cryptool
	- PIN verification: cryptool
#image("/images/dig_b6.jpg")

#pagebreak()
- Nhấn nút “Create Certificate and PSE”.
#image("/images/dig_b7.jpg")

#pagebreak()
- Chọn “Compute hash value”.
#image("/images/dig_b8.jpg")

#pagebreak()
- Chọn “Encrypt hash value”.
#image("/images/dig_b9.png")

#pagebreak()
- Chọn “Generate signature”
#image("/images/dig_b10.jpg")

#pagebreak()
- Chọn “Store signature”

#image("/images/dig_b11.jpg")

#pagebreak()
- Nhấn nút OK, chúng ta được thông điệp và chữ ký số như hình bên dưới.
#image("/images/dig_b12.jpg")


== Câu 2: Hãy cho biết các yêu cầu của chữ ký số?
- Phải phụ thuộc trên thông điệp được ký.
- Phải sử dụng thông tin duy nhất từ người gửi để tránh giả mạo và từ chối.
- Phải tương đối dễ dàng để tạo.
- Phải tương đối dễ dàng để nhận biết và xác minh.
- Không khả thi trong tính toán để giả mạo
- Một thông điệp mới với chữ ký số đang tồn tại.
- Chữ ký số cho một thông điệp đã cho.
- Lưu trữ chữ ký số trong thực tế

