<?php

use TennisGame\TennisGame1;

describe(
    'Tennis Game 1',
    function () {
        describe(
            'given player scores',
            function () {
                beforeEach(function () {
                    $this->game = new TennisGame1('player1', 'player2');
                });

                it(
                    'should return the expected match result',
                    function (int $score1, int $score2, string $expectedResult) {
                        $this->seedScores($score1, $score2);
                        $this->assertSame($expectedResult, $this->game->getScore());
                    }
                )->with('scoreResults');
            }
        );
    }
);
