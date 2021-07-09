<?php

namespace Database\Seeders;

use App\Models\Bioskop;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class StudioSeeder extends Seeder
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

        $cin_ids = Bioskop::all()->pluck('cin_id')->toArray();

        for($i = 1; $i <= 1000; $i++)
        {
            $studioData[] = [
                'cin_id'                 => $cin_ids[array_rand($cin_ids)],
                'std_kapasitas'          => $faker->numberBetween(50, 250)
            ];
            echo 'Creating data: '.$i.PHP_EOL;
        }

        $chunks = array_chunk($studioData, 100000);
        foreach($chunks as $chunk) {
            DB::table('studio')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
