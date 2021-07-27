# Pi ports status
 
Công cụ Pps dùng để kiểm tra các cổng mặc định của ứng dụng Pi node trên hệ điều hành Windows 10 pro.
Pi ports status i.e: pps is tiny tool to check default Windows-based Pi node application opened ports.

Ứng dụng sử dụng an toàn các hàm chuẩn của Windows Powershell cung cấp.
Tool is written in Windows Powershell 5.1.15063.1387


## Overview - Tổng quan

Kiểm tra trạng thái đóng/mở hiện tại của các cổng mặc định 31400-31409
Check status of default port numbers from 31400 to 31409

- Kiểm tra đơn giản 3 cổng chính hiện tại Pi node đang dùng, đó là 31401, 31402 và 31403
Check 3 major port numbers i.e: 31401, 31402 and 31403 

- Kiểm tra đầy đủ 10 cổng chính hiện tại Pi node đang dùng, đó là 31400- 31409
Fully check 10 port numbers i.e: 31400-31409

- Đề xuất khởi động lại docker khi thấy cổng 31402 bị đóng bất ngờ.
Optional suggest to restart docker in case of major port number 31402 is occasionally closed.

- Xem thông tin phiên bản docker đang dùng
Get current docker version 

## Usage - Cách dùng
Tải ứng dụng về máy, cụ thể lưu ở ổ đĩa C:, sau đó bấm chuột phải chọn" Run with Powershell" 
Download pps.ps1 tool then save to C: drive. Right click then choose "Run with Powershell"

Lưu ý: Cần cho phép ứng dụng được phép chạy trong Powershell
Note: Run as Administrator in Powershell if any.

.




