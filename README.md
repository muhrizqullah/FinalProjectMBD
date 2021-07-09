# FinalProjectMBD
Repositori Final Project Manajemen Basis Data Kelas D Teknik Informatika ITS

1. buat database baru
2. atur direktori ke working direktori TIXID_App
3. buka terminal, composer install
4. cp .env.example .env
5. buka app, file .env, sesuaikan database
  - DB_CONNECTION=pgsql
  - DB_HOST=127.0.0.1
  - DB_PORT=5432
  - DB_DATABASE={nama database}
  - DB_USERNAME=postgres
  - DB_PASSWORD={password postgre}
7. php artisan db:seed
