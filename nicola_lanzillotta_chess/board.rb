require_relative 'pieces'

class Board
    attr_reader :rows

    def initialize(fill_board = true)
        @sentinel = NullPiece.instance
        make_starting_grid(fill_board)
    end

    def [](pos)
        raise "invalid pos" unless valid_pos?(pos)

        row, col = pos
        @rows[row][col]
    end

    def []=(pos, piece)
        raise "invalid pos" unless valid_pos?(pos)

        row, col = pos
        @rows[row][col] = piece
    end

    def add_piece(piece, pos)
        raise 'position not empty' unless empty?(pos)

        self[pos] = piece
    end

    def empty?(pos)
        self[pos].empty?
    end

    def move_piece(turn_color, start_pos, end_pos)
        raise "Start position is empty" if empty?(start_pos)

        piece = self[start_pos]
        if piece.color != turn_color
            raise "You must move your own piece"
        elsif !piece.moves.include?(end_pos)
            raise "Piece does not move like that"
        elsif !piece.valid.moves.include?(end_pos)
            raise "You cannot move into check"
        end

        move_piece!(start_pos, end_pos)
    end

    def move_piece!(start_pos, end_pos)
        piece = self[start_pos]
        raise "piece cannot move like that" unless piece.moves.include?(end_pos)

        self[end_pos] = pos
        self[start_pos] = sentinel
        piece.pos = end_pos

        nil
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    private

    attr_reader :sentinel

    def fill_back_row(color)
        back_pieces = [
            Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
        ]

        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece_class, j|
            piece_class.new(color, self, [i, j])
        end
    end

    def fill_pawns_row(color)
        i = color == :white ? 6 : 1
        8.times { |j| Pawn.new(color, self, [i, j]) }
    end

    def make_starting_grid(fill_board)
        @rows = Array.new(8) { Array.new(8, sentinel) }
        return unless fill_board
        %i(white black).each do |color|
            fill_back_row(color)
            fill_pawns_row(color)
        end
    end
end