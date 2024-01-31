<?php

namespace App\Controller;

use App\Repository\StudentRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StudentController extends AbstractController
{
    public function __construct(readonly StudentRepository $studentRepository)
    {
    }

    #[Route('/', name: 'app_student')]
    public function index(): Response
    {
        $students = $this->studentRepository->findAll();

        return $this->render('index.html.twig', [
            'students' => $students,
        ]);
    }
}
