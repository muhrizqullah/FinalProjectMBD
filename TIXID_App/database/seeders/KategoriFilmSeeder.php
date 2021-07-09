<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;


class KategoriFilmSeeder extends Seeder
{
    /*
    *
    * Run the database seeds.
    *
    * @return void
    */
    public function run()
    {
        ini_set('memory_limit', '-1');
        $faker = Faker::create();

        for($i = 1; $i <= 10; $i++)
        {
            $kategoriData[] = [
                'cat_nama'      => $faker->word()
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($kategoriData, 10000);
        foreach($chunks as $chunk) {
            DB::table('kategori_film')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
