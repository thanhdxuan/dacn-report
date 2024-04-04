= Tìm hiểu Kali Linux và các công cụ liên quan
== Kali Linux là gì?

Kali Linux là một phát triển debian Linux - một phân phối của phiên bản linux. Mục tiêu của Linux là tập hợp lại các công cụ kiểm tra bảo mật trong môi trường hệ điều hành giúp người dùng tiện lợi hơn trong việc tìm kiếm phần mềm kiểm thử, hạcking, tấn công,... Kali còn hỗ trợ các package giúp cho việc cài đặt và cập nhật phần mềm một cách nhanh chóng, tương thích đa nền tảng điện thoại, cloud,....

== Hãy cho biết các nhóm công cụ liên quan hiện có trên Kali Linux

- *Information*: Otrace, arping, auitomater, braa,..
- *Vulnerability*: bed, cisco-ocs, dhcpig, nmap, zmap,..
- *WebApps*: apache-users, burpsuite, fitmap, drib,..
- *Database*: bbqsql, jSQL Injection, sqlsus, sqlmap,...
- *Password*: cahcedump, crunch, chntpw, cewl,..
- *Wireless*: aircrack-ng, bully, asleap, bluelog,..
- *Reversing*: clang, clang++, jad, javasnoop,..
- *Exploit*: armitage, searchsploit, termineter,..
- *Sniffing*: fiked, hamster, dsniff, darkstat,...
- *PostExploit*: backdor-factory, dbd, exe2hex,...
- *Forensics*: binwalk, affcat, dc3dd,...
- *Reporting*: cutycapt, maltego, faraday IDE,..
- *SETools*: u3-pwn, ghost phisher,...
- *Services*: beef start, beef stop,..

= Cài đặt máy ảo Kali Linux
== Cài đặt Virtual Box
- *Bước 01*: Tải installer từ trang chủ của VirtualBox (#link("https://www.virtualbox.org/wiki/Downloads")):
#align(center)[
	#image("../images/virtualbox-download.png", width: 90%)
]

- *Bước 02*: Chạy installer vừa mới tải về, và làm theo hướng dẫn.

#align(center)[
	#image("../images/virtualbox-install-setup.png", width: 90%)
]

- *Bước 03*: Kết quả sau khi cài đặt, xem thông tin:

#align(center)[
	#image("../images/virtualbox-install-successfully.png", width: 90%)
]

#pagebreak()
== Dowload và tạo máy ảo Kali Linux. Hãy cho biết các bước và một số hình ảnh
	
- *Bước 01*: Tải installer từ trang chủ của Kali Linux (#link("https://www.kali.org/get-kali/#kali-installer-images"))
#align(center)[
	#image("../images/kali-download.png", width: 90%)
]

- *Bước 02*: Sử dụng Virtual Box để tạo máy ảo với image mới vừa tải

	Chọn *Mở VirtualBox* $-->$  *_New_* $-->$ *Đặt tên cho máy ảo, chọn image để tạo máy ảo (đường dẫn đến file .iso mới tải về)* $-->$ *_Next_*.
#align(center)[
	#image("../images/kali-install-step1.png", width: 90%)
]

#pagebreak()
- *Bước 03*: Setup các thông số như RAM, Storage (Dung lượng ổ đĩa), Số Cores, ...
#align(center)[
	#image("../images/kali-install-step2.png", width: 90%)
]

- *Bước 04*: Khởi động máy ảo

	Chọn Máy ảo vừa tạo $-->$ *_Start_*, máy ảo sẽ boot vào trình cài đặt, ở đây chúng ta sẽ cấu hình các thông số như *Languages, Keyboard, Datetime, Username, Password, Partition, ...*

- Sau khi cài đặt xong, kết quả sẽ như sau:

#align(center)[
	#image("../images/kali-install-successfully.png", width: 90%)
]

#pagebreak()
= Thu thập thông tin mạng bằng cách quét mạng
== Sử dụng công cụ Nmap/Zenmap

*Nmap*

Xem thông tin hướng dẫn của `nmap`: 
```sh nmap --help```

#show image: set align(center)
#image("../images/kali-nmap-info.png", width: 90%)

Xem thông tin địa chỉ ip của máy ảo:	```sh ifconfig```
#image("../images/kali-ifconfig.png", width: 90%)

$==>$ Địa chỉ ip của máy ảo `Kali Linux` là `192.168.1.8` và mạng hiện tại đang kết nối là `192.168.1.0/24`.

Vậy ta sẽ scan trên mạng này để tìm các host đang hoạt động.
```sh
	nmap -sn 192.168.1.0/24
```
Ta có kết quả sau:
#image("../images/kali-scannetwork-result.png", width: 90%)

Từ hình trên, ta thấy có các host sau đang hoạt động: `192.168.1.1`, `192.168.1.5`, `192.168.1.6`, `192.168.1.8`, `192.168.1.108`.

Ta thử kiểm tra chi tiết một host bất kỳ bằng câu lệnh sau:
```sh
	nmap -A 192.168.1.108
```
Kết quả:
#image("../images/kali-scannetwork-inspect01.png", width: 90%)
#image("../images/kali-scannetwork-inspect02.png", width: 90%)

Từ 02 hình trên, ta có thể lấy được các thông tin sau từ `192.168.1.108`:
- Các port đang mở: `80/tcp`, `554/tcp`, `49152/tcp`
- Đây là 1 Camera
- ...

*Zenmap*

Tương tự `nmap`, `zenmap` là công cụ cung cấp giao diện cho `nmap`, dưới đây là 1 số hình ảnh về `zenmap`:

#image("../images/kali-zenmap01.png", width: 90%)
#image("../images/kali-zenmap02.png", width: 90%)

== Sử dụng Angry IP Scanner
*Cài đặt*
```sh
# <package.deb> được download từ trang chủ của AIS
sudo dpkg -i <package.deb>
```

*Sử dụng*

Sau khi cài đặt xong, chúng ta có thể sử dụng bằng cách chọn range IP mà minh muốn scan.

#image("../images/kali-angscanner01.png", width: 90%)

== Đánh giá mức độ nguy hiểm của loại hình tấn công này
Sử dụng những công cụ như trên để tấn công vào một trang web, máy chủ có thể làm lộ ra những lỗ hỏng có thể kể đến như: lộ license version của backend, lộ thông tin database (sql injection), lộ các thông tin về mã hóa, khóa, từ đó tin tặc dựa vào những lỗ hổng ấy có thể cài thêm các mã độc, nghe lén thông tin,... Với máy cá nhân, biết được địa chỉ IP, tin tặc có thể biết được hành vi và thông tin của đối tượng bị tấn công, từ đó có thể fake IP giả danh thành đối tượng đó.
== Biện pháp đối phó
- Sử dụng tường lửa, SDN (software define network) để kiểm soát lưu lượng truy cập mạng tốt hơn.
- Với server, tránh để lộ thông tin về lisence, version, các package được cài, thông tin về database thông qua cách sử dụng hash, câu truy vấn sử dụng thêm những điều kiện đặc biệt.
- Với người dùng thì có thể cài thêm các lớp xác thực, hạn chế truy cập thông tin, trang web có dấu hiệu khả nghi, chặn quảng cáo,.. 

= Nghe lén thông tin, dữ liệu

== Dùng Wireshark để bắt gói, phân tích gói tin bắt được. Hãy cho biết các bước và một số hình ảnh

*Wireshark*

Trang chủ của wireshark hiển thị các mạng để ta capture, ta chọn `eth0` - mạng ứng với địa chỉ IP của máy mình. 
#image("../images/kali-wireshark-start.png", width: 60%)

*Capture*

#image("../images/kali-wireshark-01.png", width: 80%)

Ở đây ta có thể thấy được gói tin đi qua mạng, với các thông số như Source(IP của máy gửi), Destination (IP của máy nhận), Protocol (Phương thức), chúng ta có thể filter kết quả để tiện trong việc tìm kiếm.

== Đánh giá mức độ nguy hiểm của loại hình tấn công này
Whireshark thường được sử dụng trong loại hình tấn công man in the middle đây là loại hình tấn công vô cùng nguy hiểm, khi đó hacker sẽ bắt được gói tin của ta và từ đó hắn có thể phân tích các trường thông tin quan trọng để bắt được các thông điệp cũng như là nắm được các cơ chế mã hóa thông tin từ đó nắm được điểm yếu và sơ hở cả 2 phía gửi và nhận. Nếu chúng ta sử dụng mã khóa đối xứng và trao đổi khóa không đảm bảo yêu cầu bảo mật cao thì dùng whireshark ta có thể bắt được khóa đối xứng đó và sử dụng để có thể thực hiện các bước tấn công tiếp theo như replay attack, snoofing,.. Nếu không phát hiện kịp thời sẽ dẫn đến chỗ bị tấn công có thể bị sập, bị truy cập trái phép, lộ thông tin cá nhân,.. và sẽ gây tổn thất không hề nhỏ.

== Biện pháp đối phó
- Sử dụng mã khóa công khai cũng như các kĩ thuật như Hash, Chữ ký số để che giấu thông điệp và đảm bảo an toàn thông tin khóa.
- Kết nối an toàn, hạn chế dùng wifi “chùa”, khi truy cập web có thể để ý xem thử web đó đã có chứng chỉ ssl chưa thông qua https
- Sử dụng mã hóa VPN, tạo một tunnel, session riêng tư để trao đổi dữ liệu.

= Cài đặt máy chủ CentOS7
== Hệ điều hành CentOS là gì?
CentOS (Community Enterprise Operating System) chính là một bản phân phối Linux có mã nguồn mở, và hoàn toàn miễn phí dành cho doanh nghiệp. Bản phân phối này có chức năng tương thích với Red Hat Enterprise Linux (RHEL). Hệ điều hành CentOS không chỉ giúp doanh nghiệp xây dựng được nền tảng hệ thống máy chủ, mà còn cung cấp môi trường lý tưởng phục vụ cho các hoạt động lập trình. Các ưu điểm của CentOS đó là: Hệ điều hành CentOS không chỉ giúp doanh nghiệp xây dựng được nền tảng hệ thống máy chủ, mà còn cung cấp môi trường lý tưởng phục vụ cho các hoạt động lập trình,...

== Cài đặt CentOS
_NOTE: Ở đây em dùng bản CentOS Stream 8 thay thế bản 7 (không làm thay đổi mục đích của bài Lab)_

Tương tự như cài đặt `Kali Linux`, chúng ta sẽ tải image, tạo máy ảo trên Virtual Box và Start. Sau khi khởi động máy ảo, máy sẽ boot vào trình cài đặt của CentOS.

#image("../images/centos-install.png", width: 70%)
#image("../images/centos-install02.png", width: 70%)

Kết quả sau khi cài đặt xong
#image("../images/centos-install-successfully.png", width: 70%)

== Cấu hình để CentOS và Kali Linux có thể "thấy" nhau.

Để CentOS và Kali Linux thấy được nhau, chúng ta sẽ cấu hình mạng cho 2 máy ảo này vào cùng 1 network. Chúng ta mở *VirtualBox* $-->$ *Chọn máy ảo Kali* $-->$ *Settings* $-->$ *Network*. Ở phần _Adapter 1_, chọn _Attached to: Bridged Adapter_.

Thực hiện tương tự với máy ảo CentOS.

Thông tin về các mạng của máy chủ CentOS sau khi cấu hình mạng:
- `inet 192.168.1.4/24`
- `brd 192.168.1.255`

#image("../images/centos-network.png", width: 70%)

Ta kiểm tra bằng cách ping vào máy chủ CentOS từ KaliLinux:
```sh
ping 192.168.1.4
```
#image("../images/ping-success.png", width: 70%)

Ta có thể thấy đã ping thành công.


= Tấn công vét cạn trên dịch vụ SSH của máy chủ CentOS 7

== Sử dụng `hydra` trên Kali Linux
Hydra là một công cụ brute force mạnh mẻ; một công cụ ‘hack’ mật khẩu đăng nhập hệ thống nhanh chóng. Chúng ta có thể sử dụng Hydra để duyệt qua một danh sách và ‘bruteforce‘ một số dịch vụ xác thực. Hãy tưởng tượng bạn đang cố gắng đoán thủ công một số mật khẩu trên một dịch vụ cụ thể (SSH, Web Application Form, FTP hoặc SNMP) – chúng ta có thể sử dụng Hydra để duyệt qua danh sách mật khẩu và tăng tốc quá trình này để xác định mật khẩu chính xác.

*Sử dụng `hydra`*
```sh
	hydra -h
```

#image("../images/kali-hydra-info.png", width: 90%)

Để sử dụng `hydra` chúng ta cần xác định:
- `target`: Địa chỉ ip/url của máy chủ.
- `service`: Trên máy chủ có nhiều dịch vụ, cần xác định cần tấn công dịch vụ nào, mỗi dịch vụ sẽ ứng với một `port` khác nhau.
- `login_info`: Thông tin đăng nhập và mật khẩu (tự tạo hoặc lấy ra từ một nguồn bất kỳ)

Một số `option` cần lưu ý:
- `-l` <login> or `-L` <login.txt>: chỉ tên đăng nhập hoặc file chứa các tên đăng nhập.
- `-p` <password> or `P` <password.txt>: chỉ mặt khẩu hoặc file chứa các mật khẩu.
- `-t`: Số luồng tấn công đồng thời.

== Dùng công cụ hydra tấn công vét cạn trên dịch vụ SSH của máy chủ CentOS 7 với từ điển hiện có:

Tạo thư viện với 2 file `login.txt` và `password.txt` với nội dung như hình và thực hiện tấn công:
```sh
hydra -L login.txt -P password.txt ssh://192.168.1.4
```
#image("../images/kali-attack-01.png", width: 80%)

* Kết quả: * Tìm thấy thành công tài khoản: `root`, mật khẩu `2014486`.

== Tạo danh sách các mật khầu (wordlist) bằng crunch và dùng hydra tấn công vét cạn trên dịch vụ SSH của máy chủ CentOS 7 dùng danh sách mật khẩu đã tạo ra

```sh
# crunch <min> <max> <charset> -t <pattern> -o <output_file>
# Giả sử ta biết chắc username là root hoặc admin
echo "root" >> login.txt
echo "admin" >> login.txt

# Ta sẽ dùng crunch để tạo list mật khẩu
# Ta giả sử 1 số thông tin đã biết như độ dài = 7, ... để tiết kiệm thời gian

crunch 7 7 012468 -t 2014@@@ -o password.txt
```

#image("../images/kali-hydra-result.png", width: 80%)

Tốn hơn 3 phút để `hydra` tìm ra mật khẩu với hơn 300 lần thử.

== Đánh giá mức độ nguy hiểm của loại hình tấn công này

Dùng cách này, ta có thể tấn công ping of death, giành quyền truy cập máy chủ, từ đó có thể giả danh máy chủ mà đi tấn công các máy chủ khác dẫn đến cuộc tấn công DDOS. Nếu không ngăn chặn kịp thời hệ thống của bạn sẽ bị sập hoặc sẽ dẫn đến mất mát lộ thông tin và giả danh thông tin. Một số cách để làm giảm thiểu khả năng bị tấn công:
Với máy chủ, máy tính cá nhân, sử dụng mật khẩu mạnh và khó đoán (dài) tránh thêm những thông tin nhạy cảm và dễ đoán trong mật khẩu như ngày sinh, số điện thoại,..
Có thể cài đặt các công cụ để cho phép ssh đến máy của mình một tối thiểu số lần cho phép.
Sử dụng các yếu tố xác thực khác như capcha, khuôn mặt, tránh làm lộ địa chỉ IP 

= Giải pháp giảm thiểu tấn công vét cạn
== `fail2ban`
Fail2ban là phần mềm hoạt động dựa trên việc hỗ trợ nguyên tắc, theo dõi log của hệ thống. Dựa trên cơ sở đó, bạn sớm phát hiện và ngăn chặn những cuộc tấn công vào server của mình. Cụ thể hơn, phần mềm tập trung phát triển, bảo vệ SSH, đẩy lùi nguy cơ Brute Force Attack và cũng có thể thiết lập Rules, tham số khác để sử dụng trên bất cứ dịch vụ nào hỗ trợ log file. Ngoài ra fail2ban còn hỗ trợ: Có thể phân tích các tệp nhật ký và tìm kiếm các mẫu, Tạo lệnh cấm, quy ước trong một khoảng thời gian nhất định, Hỗ trợ Database,...

== Cài đặt và cấu hình fail2ban đối với dịch vụ SSH trên máy chủ CentOS 

* Cài đặt*
```sh
	sudo yum install 
	sudo yum install fail2ban
```

* Cấu hình*

```sh
	vi /etc/fail2ban/jail.local
```

```config
[sshd]

enabled  = true
filter   = sshd
action   = iptables[name=SSH, port=ssh, protocol=tcp]
logpath  = /var/log/secure.log
maxretry = 3
bantime = 3600

```
*Start `fail2ban` service*
```sh
service fail2ban enable
service fail2ban start
```

* Kiểm tra `fail2ban` liệu đã hoạt động*
```sh

systemctl status fail2ban
```

#image("../images/centos-status.png", width: 90%)

Vậy chúng ta đã cấu hình `fail2ban` thành công.

== Dùng công cụ hydra tấn công vét cạn trên dịch vụ SSH của máy chủ CentOS 7 và cho biết kết quả:

Chúng ta tấn công lại bằng câu lệnh trước đây.

#image("../images/kali-reattack.png", width: 90%)

Kiểm tra các ip bị fail2ban ban:
```sh
fail2ban-client status sshd
```
#image("../images/centos-ban.png", width: 90%)

Ta thấy có 1 địa chỉ IP `192.168.1.8` - Chính là Kali Linux của chúng ta.

Kiểm tra log:

#image("../images/centos-ban-log.png", width: 90%)


Vậy là `Kali Linux` (`192.168.1.8`) đã bị ban thành công.


