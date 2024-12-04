create database tintuc;
use tintuc;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role INT NOT NULL -- 0: người dùng, 1: quản trị viên
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    image text,
    created_at DATETIME NOT NULL,
    category_id INT, -- khóa ngoại liên kết với bảng categories
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Thêm dữ liệu vào bảng users
INSERT INTO users (username, password, role) VALUES 
('admin', 'admin_password', 1), -- Quản trị viên
('user1', 'user1_password', 0), -- Người dùng
('user2', 'user2_password', 0); -- Người dùng

-- Thêm dữ liệu vào bảng categories
INSERT INTO categories (name) VALUES 
('Công nghệ'),
('Thể thao'),
('Giải trí');

-- Thêm dữ liệu vào bảng news
INSERT INTO news (title, content, image, created_at, category_id) VALUES 
('Tin tức công nghệ 1', 'Nội dung tin tức công nghệ 1', 'image1.jpg', NOW(), 1),
('Tin thể thao hôm nay', 'Nội dung tin thể thao', 'image2.jpg', NOW(), 2),
('Showbiz cuối tuần', 'Nội dung showbiz mới nhất', 'image3.jpg', NOW(), 3);
use tintuc;
select * from news join categories on news.category_id = categories.id;