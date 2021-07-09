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
            PelangganSeeder::class,
            MetodePembayaranSeeder::class,
            VoucherSeeder::class,
            KategoriFilmSeeder::class,
            FilmSeeder::class,
            BioskopSeeder::class,
            StudioSeeder::class,
            JadwalSeeder::class,
            TransaksiSeeder::class,
            DetailVoucherSeeder::class,
            KursiSeeder::class,
            TiketSeeder::class,
        ]);
    }
}
