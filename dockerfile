# Sử dụng image Python chính thức
FROM python:3.11-slim

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Cài đặt các phụ thuộc
RUN pip install flask

# Sao chép mã nguồn ứng dụng vào container
COPY . /app/

# Mở cổng 5000 để ứng dụng Flask có thể lắng nghe
EXPOSE 5000

# Lệnh chạy ứng dụng Flask
CMD ["python", "app.py"]
