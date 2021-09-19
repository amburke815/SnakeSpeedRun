;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Snake) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; SNAKE ;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; GAME DEF ;;;

;; A SnakeGame is a game consisting of a
;; - Snake
;; - Integer: time
;; - Difficulty
;; - Fruit

;; (make-snake-game s p t d f) := A SnakeGame with a Snake _s_, a current time _t_, and a Fruit _f_
(define-struct snake-game (snake time difficulty fruit))

;; snake-game-template :: SnakeGame -> ???
#;(define (snake-game-template sg)
    (... (snake-template (snake-game-snake sg))
         (snake-game-time sg)
         (snake-game-difficulty sg)
         (fruit-template (snake-game-fruit sg)) ...))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SNAKE DEF ;;;

;; A Snake consists of a
;; - [List-of SnakePart] -> One of:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; - (cons SnakePart [List-of SnakePart])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; - '()
;; - Direction


;; (make-snake losp d) := A Snake consisting of a [List-of SnakePart] _losp_ and with a head pointing
;; in the Direction _d_
 
