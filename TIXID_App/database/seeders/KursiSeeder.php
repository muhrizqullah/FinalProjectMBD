<?php

namespace Database\Seeders;

use App\Models\Jadwal;
use App\Models\Tiket;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Faker\Factory as Faker;

class KursiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
    ini_set('memory_limit','-1');

    $faker = Faker::create();

    $Jadwal_ids = Jadwal::all()->pluck('sch_id')->toArray();

    for($i = 1;$i <= 10;$i++){
        $KursiData[]= [
            'sch_id'                => $Jadwal_ids[array_rand($Jadwal_ids)],
            'chr_kode'              => $faker->bothify('?-##')
        ];

        echo 'Creating data: ' .$i.PHP_EOL;
    }

        $chunks = array_chunk($KursiData, 100000);
        foreach($chunks as $chunk) {
            DB::table('kursi')->insertOrIgnore($chunk);
            echo 'Inserting data...'.PHP_EOL;
        }
    }
}
