<?php

namespace App\Twig\Components;

use App\Repository\ProductRepository;
use Symfony\UX\LiveComponent\Attribute\AsLiveComponent;
use Symfony\UX\LiveComponent\Attribute\LiveAction;
use Symfony\UX\LiveComponent\Attribute\LiveProp;
use Symfony\UX\LiveComponent\DefaultActionTrait;
use Symfony\UX\LiveComponent\ComponentToolsTrait;

#[AsLiveComponent]
class ProductSearchComponent
{
    use DefaultActionTrait;
    use ComponentToolsTrait;

    #[LiveProp(writable: true)]
    public string $query = '';

    public function __construct(
        private ProductRepository $productRepository
    ) {
    }


    public function getProducts(): array
    {
        return $this->productRepository->searchByNameOrDescription($this->query);
    }

    #[LiveAction]
    public function showNotification()
    {
        $this->dispatchBrowserEvent('notification:show', [
            'message' => 'Se llamo desde el live component.',
            'type' => 'warning',
        ]);
    }
}
