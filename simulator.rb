class BoardPossibility
  @@GameEndBoards = Array.new

  def initialize(arrangement, previousMoves)
    @subBoards = Array.new
    @b = arrangement
    @p = previousMoves
    @hasSubBoard = false
  end

  def findSubBoards()
    tryMove(0,2,5)
    tryMove(0,1,3)

    tryMove(1,3,6)
    tryMove(1,4,8)

    tryMove(2,4,7)
    tryMove(2,5,9)

    tryMove(3,1,0)
    tryMove(3,4,5)
    tryMove(3,7,12)
    tryMove(3,6,10)

    tryMove(4,7,11)
    tryMove(4,8,13)

    tryMove(5,2,0)
    tryMove(5,4,3)
    tryMove(5,8,12)
    tryMove(5,9,14)

    tryMove(6,3,1)
    tryMove(6,7,8)

    tryMove(7,4,2)
    tryMove(7,8,9)

    tryMove(8,4,1)
    tryMove(8,7,6)

    tryMove(9,5,2)
    tryMove(9,8,7)

    tryMove(10,6,3)
    tryMove(10,11,12)

    tryMove(11,7,4)
    tryMove(11,12,13)

    tryMove(12,7,3)
    tryMove(12,8,5)
    tryMove(12,11,10)
    tryMove(12,13,14)

    tryMove(13,12,11)
    tryMove(13,8,4)

    tryMove(14,9,5)
    tryMove(14,13,12)

    if not @hasSubBoard
      @@GameEndBoards.push(self)
      printBoard()
    end
    for board in @subBoards
      board.findSubBoards()
    end
  end

  def tryMove(pega, pegb, pegc)
    if @b[pega] and @b[pegb] and not @b[pegc]
      b2 = @b.clone
      b2[pega] = false
      b2[pegb] = false
      b2[pegc] = true
      p2 = @p + pega.to_s + "-" + pegc.to_s + ","
      @subBoards.push(BoardPossibility.new(b2, p2))
      @hasSubBoard = true
    end
  end

  def printBoard()
    b = Array.new
    piecesLeft = 0
    for piece in @b
      if piece
        b.push("0")
        piecesLeft = piecesLeft + 1
      else
        b.push("-")
      end
    end
    if (piecesLeft == 1)
      puts "    " + b[0]
      puts "   " + b[1] + " " + b[2]
      puts "  " + b[3] + " " + b[4] + " " + b[5]
      puts " " + b[6] + " " + b[7] + " " + b[8] + " " + b[9]
      puts "" + b[10] + " " + b[11] + " " + b[12] + " " + b[13] + " " + b[14]
      puts @p + piecesLeft.to_s + " piece left"
    end
  end
end

initialBoard = Array.new(15, true)
initialBoard[0] = false

board = BoardPossibility.new(initialBoard, "")
board.findSubBoards()
