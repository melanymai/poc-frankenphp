<?php

namespace App\DataFixtures;

use App\Entity\Student;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        $faker = Factory::create();

        for ($i = 0; $i < 10; $i++) {
            $student = new Student();
            $student->setFirstname($faker->firstName());
            $student->setLastname($faker->lastName());
            $manager->persist($student);
        }

        $manager->flush();
    }
}
