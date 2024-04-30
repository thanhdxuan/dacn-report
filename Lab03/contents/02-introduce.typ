=  Mã xác thực thông điệp MAC

== Câu 1: Sử dụng công cụ Cryptool để tính toán HMAC cho một thông điệp theo các 
bước như bên dưới

=== Tính Hmac cho hàm MD5

- H(k,m): key in front of message
#image("/images/md5_b1.jpg")

#pagebreak()
- H(m,k): key in back of message
#image("/images/md5_b2.jpg")

#pagebreak()
- H(k,m,k): key in front and at the back of message
#image("/images/md5_b3.jpg")

#pagebreak()
- H(k,m,k’): different keys
#image("/images/md5_b4.jpg")

#pagebreak()
- H(k,H(k,m)): double hashing (RFC 2104)
#image("/images/md5_b5.jpg")

=== Tính Hmac cho hàm SHA-256

#pagebreak()
- H(k,m): key in front of message
#image("/images/sha256_b1.jpg")

#pagebreak()
- H(m,k): key in back of message
#image("/images/sha256_b2.jpg")

#pagebreak()
- H(k,m,k): key in front and at the back of message
#image("/images/sha256_b3.jpg")

#pagebreak()
- H(k,m,k’): different keys
#image("/images/sha256_b4.jpg")

#pagebreak()
- H(k,H(k,m)): double hashing (RFC 2104)
#image("/images/sha256_b5.jpg")

== Câu 2: Hãy liệt kê những hình thức tấn công dựa trên xác thực thông điệp?

- Tấn công ngày sinh nhật 
- Tấn công Meet in the middle
- Tấn công brute force 

== Câu 3: Trình bày sự khác nhau giữa mã xác thực thông điệp (MAC) và hàm băm (Hash)

#table(
  columns: (auto, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  table.header(
    [], [*MAC*], [*Hashing*],
  ),
  [Tính chất],[Xác thực, toàn vẹn],[Toàn vẹn],
	[Giải thuật], [Cô đọng một thông điệp M có chiều dài thay đổi dùng một khóa bí mật K thành một mã xác thực có chiều dài cố định.], [Cô đọng một thông điệp M có chiều dài thay đổi thành một mã xác thực có chiều dài cố định.],
	[Yêu cầu], [
	- Phân bố đồng đều
	- Phụ thuộc như nhau trên tất cả các bit
	- Biết thông điệp và mã xác thực thông điệp của nó thì không khả thi để tìm ra một thông điệp khác có cùng mã xác thực thông điệp
	
], [
	- Cho h thì không khả thi để tìm x mà H(x)=h
	- Cho x thì không khả thi để tìm y mà H(y)=H(x)
	- Không khả thi để tìm x,y mà H(y)=H(x)

]
)

