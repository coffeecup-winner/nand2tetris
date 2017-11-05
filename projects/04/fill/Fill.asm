// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(:LOOP)
  @$color
  M = -1
  @KBD
  D = M
  @:KEY
  D ; JGT
  @$color
  M = 0
(:KEY)
  @8191
  D = A
  @$curr
  M = D
(:SCREEN_LOOP)
  @$curr
  D = M
  @SCREEN
  D = D + A
  @$cell
  M = D
  @$color
  D = M
  @$cell
  A = M
  M = D
  @$curr
  MD = M - 1
  @:SCREEN_LOOP
  D ; JGE
  @:LOOP
  0 ; JMP
