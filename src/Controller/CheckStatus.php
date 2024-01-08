<?php

declare(strict_types=1);

namespace App\Controller;

use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class CheckStatus extends AbstractController
{
    public function __construct(private readonly LoggerInterface $logger)
    {
    }

    #[Route('/check/', name: 'check', methods: [Request::METHOD_GET])]
    public function check(): Response
    {
        $this->logger->error('test');
        return new Response('ok');
    }
}
