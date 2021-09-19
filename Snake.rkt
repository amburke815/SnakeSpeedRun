;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Snake) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; SNAKE ;;


;;; GAME DEF ;;;

;; A SnakeGame is a game consisting of a
;; - Snake
;; - Integer: time
;; - Difficulty
;; - Fruit

;; (make-snake-game s p t d f) := A SnakeGame with a Snake _s_, a
(define-struct snake-game (snake time difficulty fruit))
cat S