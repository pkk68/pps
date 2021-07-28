# Pi ports status
 
Công cụ Pps dùng để kiểm tra các cổng mặc định của ứng dụng Pi node trên hệ điều hành Windows 10 pro.

_Pi ports status i.e: pps is tiny tool to check default Windows-based Pi node application opened ports._

Ứng dụng sử dụng an toàn các hàm chuẩn của Windows Powershell cung cấp.

_Tool is written in Windows Powershell 5.1.15063.1387_


## Overview - Tổng quan

Kiểm tra trạng thái đóng/mở hiện tại của các cổng mặc định 31400-31409.

_Check status of default port numbers from 31400 to 31409_

- Kiểm tra đơn giản 3 cổng chính hiện tại Pi node đang dùng, đó là 31401, 31402 và 31403.

_Check 3 major port numbers i.e: 31401, 31402 and 31403._

- Kiểm tra đầy đủ 10 cổng chính hiện tại Pi node đang dùng, đó là 31400- 31409.

_Fully check 10 port numbers i.e: 31400-31409._

- Đề xuất khởi động lại docker khi thấy cổng 31402 bị đóng bất ngờ.

_Optional suggest to restart docker in case of major port number 31402 is occasionally closed._

- Xem thông tin phiên bản docker đang dùng.

_Get current docker version._

## Usage - Cách dùng
Tải ứng dụng về máy, cụ thể lưu ở ổ đĩa C:, sau đó bấm chuột phải chọn" Run with Powershell".

_Download pps.ps1 tool then save to C: drive. Right click then choose "Run with Powershell"_

Lưu ý: Cần cho phép ứng dụng được phép chạy trong Powershell

_Note: Run as Administrator in Powershell if any._

Figure 1:
Execution Policy Change
The execution policy helps protect you from scripts that you do not trust. Changing the execution policy might expose
you to the security risks described in the about_Execution_Policies help topic at
http://go.microsoft.com/fwlink/?LinkID=135170. Do you want to change the execution policy?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "N"): **Y**

.




