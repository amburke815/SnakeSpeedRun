;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Snake) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; SNAKE ;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; GLOBAL CONSTANTS ;;;
(define BOARD-WIDTH 20)
(define BOARD-HEIGHT 20)

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
         (difficulty-template (snake-game-difficulty sg))
         (fruit-template (snake-game-fruit sg)) ...))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; DIFFICULTY DEF ;;;
;; A Difficulty is one of:
;; - "EASY"
;; - "MEDIUM"
;; - "HARD"

;; difficulty-template :: Difficulty -> ???
#;(define (difficulty-template d)
    (cond [(string=? d "EASY") ...]
          [(string=? d "MEDIUM") ...]
          [(string=? d "HARD") ...]
          [else ...]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; SNAKE DEF ;;;

;; A Snake is a [SnakePart]:
;;;; either
;;;; - (cons SnakePart [Snake-Part])
;;;; - '() / empty


;; (make-snake losp d) := A Snake consisting of a [List-of SnakePart] _losp_ and with a head pointing
;; in the Direction _d_
(define-struct snake (parts direction))

;; snake-template :: Snake -> ???
#;(define (snake-template s)
    (cond [(empty? s) ...]
          [(cons? s) (... (first s)
                          (snake-template (rest s)))]))

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

;; start-snake-game :: SnakeGame -> World
;; Starts a game of snake with the given SnakeGame _sg_
(define (start-snake-game sg)
  (big-bang sg
    [to-draw draw-snake-game]))


(define (draw-snake-game sg)
  (rectangle 100 100 "solid" "red"))






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; to start the game
(define STARTING-SNAKE (list (make-snake-part (make-posn 0 0) "RIGHT")))
(define STARTING-DIFFICULTY "EASY")
(define STARTING-TIME 0)
(define STARTING-FRUIT (make-fruit (make-posn (/ BOARD-WIDTH 2) (/ BOARD-HEIGHT 2)) "LEMON"))
(define STARTING-GAME (make-snake-game STARTING-SNAKE STARTING-TIME "EASY" STARTING-FRUIT))

(start-snake-game STARTING-GAME)