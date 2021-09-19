;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Snake) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; SNAKE ;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SNAKE DEF ;;;

;; A Snake consists of a
;; - [List-of SnakePart] -> One of:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; - (cons SnakePart [List-of SnakePart])
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; - '()
;; - Direction


;; (make-snake losp d) := A Snake consisting of a [List-of SnakePart] _losp_ and with a head pointing
;; in the Direction _d_
(define-struct snake (parts direction))

;; snake-template :: Snake -> ???
#;(define (snake-template s)
    (... (cond [(empty? (snake-parts s)) ...]
               [(cons? (snake-parts s)) (... (rest (snake-parts s)))])
         (direction-template (snake-direction s)) ...))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; DIRECTION DEF ;;;

;; A Direction is one of:
;; - "UP"
;; - "DOWN"
;; - "LEFT"
;; - "RIGHT"

;; direction-template :: Direction -> ???
#;(define (direction-template d)
    (cond [(string=? d "UP") ...]
          [(string=? d "DOWN") ...]
          [(string=? d "LEFT") ...]
          [(string=? d "RIGHT") ...]
          [else ...]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SNAKEPART DEF ;;;

;; A SnakePart consists of a
;; - Posn
;; - Direction

;; (make-snake-part p d) := A SnakePart with Posn _p_ in logical coordinates and moving in the
;; Direction _d_
(define-struct snake-part (position direction))

;; snake-part-template :: SnakePart -> ???
#;(define (snake-part-template sp)
    (... (posn-template (snake-part-position sp))
         (direction-template (snake-part-direction sp)) ...))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; FRUIT DEF ;;;

;; A Fruit consists of
;; - Posn
;; - FruitType

;; (make-fruit p ft) := A fruit at Posn _p_  with a type of _ft_
(define-struct fruit (position type))

;; fruit-template :: Fruit -> ???
#;(define (fruit-template f)
    (... (posn-template (fruit-position f))
         (fruit-type-template (fruit-type ft)) ...))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; A FruitType is one of:
;; - "LEMON"
;; - "CHERRY"
;; - "GRAPES"
;; - "BLUEBERRY"
;; - "ORANGE"

;; fruit-type-template :: FruitType -> ???
#;(define (fruit-type-template ft)
    (cond [(string=? ft "LEMON") ...]
          [(string=? ft "CHERRY") ...]
          [(string=? ft "GRAPES") ...]
          [(string=? ft "BLUEBERRY") ...]
          [(string=? ft "ORANGE") ...]
          [else ...]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; POSN DEF ;;;

;; A Posn (built-in to Racket) consists of a
;; - x coordinate (in logical coordinates indexed from 0)
;; - y coordinate (in logical coordinates indexed from 0)

;; (make-posn x y) := a position at logical coordinates of (_x_, _y_)
;; struct definition omitted

;; posn-template :: Posn -> ???
#;(define (posn-template p)
    (... (posn-x p)
         (posn-y p)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SETTING UP THE GAME ;;;

(require 2htdp/image) ;; for images
(require 2htdp/universe) ;; for a world program