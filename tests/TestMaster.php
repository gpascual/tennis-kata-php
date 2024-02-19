<?php

declare(strict_types=1);

namespace Tests;

use PHPUnit\Framework\TestCase;
use TennisGame\TennisGame;

abstract class TestMaster extends TestCase
{
    protected TennisGame $game;

    protected function seedScores(int $score1, int $score2): void
    {
        $highestScore = max($score1, $score2);
        for ($i = 0; $i < $highestScore; $i++) {
            if ($i < $score1) {
                $this->game->wonPoint('player1');
            }
            if ($i < $score2) {
                $this->game->wonPoint('player2');
            }
        }
    }
}
