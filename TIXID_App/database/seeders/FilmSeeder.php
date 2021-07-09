<?php

namespace Database\Seeders;

use App\Models\KategoriFilm;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class FilmSeeder extends Seeder
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

        $category_ids = KategoriFilm::all()->pluck('cat_id')->toArray();

        for($i = 1; $i <= 10; $i++)
        {
            $filmData[] = [
                'cat_id'                => $category_ids[array_rand($category_ids)],
                'mov_judul'             => $faker->word(),
                'mov_durasi'            => $faker->numberBetween(60,180)
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($filmData, 100000);
        foreach($chunks as $chunk) {
            DB::table('film')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
