CLASS zst_diff_of_squares DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      ret_difference_of_squares IMPORTING num         TYPE i
                                RETURNING VALUE(diff) TYPE i,
      ret_sum_of_squares        IMPORTING num                   TYPE i
                                RETURNING VALUE(sum_of_squares) TYPE i,
      ret_square_of_sum         IMPORTING num                  TYPE i
                                RETURNING VALUE(square_of_sum) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zst_diff_of_squares IMPLEMENTATION.
  METHOD ret_difference_of_squares.
    diff = ret_square_of_sum( num = num ) - ret_sum_of_squares( num = num ).
  ENDMETHOD.

 METHOD ret_sum_of_squares.
    sum_of_squares = REDUCE #( INIT y = 0
                               FOR i = 1 UNTIL i > num
                               NEXT y = y + ipow( base = i exp = 2 ) ).
  ENDMETHOD.

  METHOD ret_square_of_sum.
    DATA(temp_x) = REDUCE #( INIT x = 0
                             FOR i = 1 UNTIL i > num
                             NEXT x = x + i ).
    square_of_sum = ipow( base = temp_x exp = 2 ).
  ENDMETHOD.
ENDCLASS.
