# Require

"" Xây dựng chương trình quản lý học sinh (áp dụng cho khung chuowngtrinfh trung học phổ thông) ""

# User 

- Admin : người dùng có quyền thêm, sửa, xóa tất cả các mục trong ứng dụng
- Teacher : quyền sửa thông tin học sinh, thông tin điểm, đưa ra đánh giá về học sinh
- Student : đăng nhập, xem thông tin lớp học, xem điểm, sửa thông tin cá nhân (có nhiều phụ huynh)
- Parent : có nhiều học sinh 

# Giao diện

- Tách thêm 1 trang tĩnh: trang tĩnh riêng để quảng cáo (admin set-up : thêm banner, set content, sale ... )
- Dashboard :
    + Học sinh: 
        _Hiển thị thông báo chung, thông báo riêng (do admin, teacher tạo)
    + Admin + teacher:
        _Thêm, sửa, xóa thông báo 
- Học tập (student):
    + Học sinh: 
        _Điểm thành phần : học sinh có thể xem điểm thành phần (bao gồm điểm kiểm tra, điểm thường xuyên, điểm thi, điểm tổng kết) của từng môn theo năm học 
        _Trung bình trung học kì : học sinh có thể xem điểm trung bình theo học kì và cả học kì
        _Đánh giá rèn luyện : xếp loại hạnh kiểm, xếp loại học sinh theo điểm tb
    + Teacher: (hiển thị danh sách các lớp học đang giảng dạy)
        _Xem điểm của tất cả học sinh trong lớp
        _Cho điểm, sửa điểm của học sinh
    + Admin: hiển thị danh sách tất cả lớp học
        _Xem điểm của tất cả học sinh
        _Không có quyền xóa, thay đổi điểm của học sinh
- Form đánh giá đầu vào:
    + lưu vào hệ thống điểm của hoc sinh
- Đánh giá rèn luyện : bao gồm xếp loại hạnh kiểm, xếp loại điểm , điểm tb theo học kì 
    + hệ học lực (1-10)
    + hạnh kiểm (a-f)
    + Admin + teacher:
        _Có quyền xem tất cả các lớp, các khóa
    + Student:
        _Hiển thị kết quả đánh giá của cá nhân theo từng kì học
- HỎi đáp :
    + Cho phép sinh viên gửi thông tin riêng tư lên admin, teacher
- Lớp học : 
    + Tất cả học sinh trong 1 lớp có thể nhắn tin trong nhóm chat chung

# Tính năng
- Gem :
    + Cancancan : phân quyền
    + Devise : login....
- JS : 
    + Nhúng video vào cam_page, top_page 
- i18n: 
    + English
    + VN 
- Delay job : 
    + Định kì chạy hàng ngày, hàng tháng
    + Cuối tuần tổng kết điểm .v.v.
- AWS : s3 (bucket - key - accesst key)
    + gem aws-sdk
    + Tải tài liệu : upload file trên s3 (giáo viên có quyền upload file lên s3)
- Search by gem: ransack

- Chat nhóm với user là học sinh (chat offline) - optimistic lock
- Activation user (email) - gem devise
- Export/ import hồ sơ học sinh > file excel 
- Đưa ra biểu đồ đánh giá kết quả học tập của học sinh 

# DB

https://drive.google.com/file/d/1Dspfw7MF1_8ntxf5zayzeldprTyfGLR-/view?usp=sharing

# Refer

- Phân quyền - gem cancancan
    https://viblo.asia/p/phan-quyen-dong-su-dung-gem-cancancan-trong-ruby-on-rails-NPVMaDWERQOk
- Chart _ admin 
    https://viblo.asia/p/thong-ke-bang-bieu-cho-trang-admin-web-voi-ror-rEBRAKxNG8Zj
- Quản lý website _ admin
    https://viblo.asia/p/thong-ke-bang-bieu-cho-trang-admin-web-voi-ror-rEBRAKxNG8Zj
- Customize rails_admin
    https://viblo.asia/p/customize-rails-admin-6BAMYV49Gnjz
    https://viblo.asia/p/tim-hieu-gem-rails-admin-ZabG9zkdvzY6
- ELASTICSEARCH
    https://viblo.asia/p/elasticsearch-trong-rails-voi-gem-searchkick-NbmvbaEDkYO
- Upload file
    https://viblo.asia/p/upload-files-trong-rails-aWj5381wK6m
- Quản lý website
    https://viblo.asia/p/xay-dung-trang-quan-li-website-su-dung-rails-admin-NPVMaDxQRQOk

# Action

- $ rails webpacker:install
- $ bundle install --without production
- Diagram: gem erd
    + $ sudo apt install graphviz
    + // Gem
        group :development do
            gem "rails-erd"
        end
    + $ bundle install
    + $ rake erd

- install bootstrap 5 :
    + $ yarn add bootstrap@next @popperjs/core // install bootstrap 5.0.0
    + $ mkdir -p app/javascript/stylesheets
    + $ touch app/javascript/stylesheets/application.scss  // @import "bootstrap";
    + file app/javascript/packs/application.js 
        window.bootstrap = require("bootstrap");
        import "../stylesheets/application.scss";

- $ rails generate controller static_pages index blog 

- Add gem devise:
    + Gemfile : gem 'devise'
    + $ bundle install
    + $ rails generate devise:install
    + $ rails generate devise Users
    + $ bundle exec rake db:create
    + $ bundle exec rake db:migrate
    + $ rails generate devise:views users
    + $ rails generate devise:controllers users 

- Customize inteface admin :
    + form login/logout
    + Gem will-paginate
- $npm i bootstrap-icons / $ yarn add bootstrap-icons
- Scaffold > student, teacher, subject
- Scaffold guardians



# Stream

- User đăng kí tài khoản gmail > đăng kí thành công
- Admin liên kết tài khoản (tạo tài khoản) sinh viên/ giáo viên/ admin > thực hiện phân quyền tài khoản (phân quyền hàng loạt)

# Bug

- Không thêm được mối quan hệ cho học sinh 
- Một Student có thể tạo nhiều mối quan hệ với 1 guardian
