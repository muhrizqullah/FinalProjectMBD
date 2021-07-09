<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            BioskopSeeder::class,
             StudioSeeder::class,
              KategoriFilmSeeder::class,
            FilmSeeder::class,
             JadwalSeeder::class,
            PelangganSeeder::class,
            MetodePembayaranSeeder::class,
            TransaksiSeeder::class,
              KursiSeeder::class,
            VoucherSeeder::class,
            DetailVoucherSeeder::class,
            TiketSeeder::class,
        ]);
    }
}
