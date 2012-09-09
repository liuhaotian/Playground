#!/usr/bin/ruby -w

$VETOR      =  {'N' => [ 0, 1],
                'W' => [-1, 0],
                'S' => [ 0,-1],
                'E' => [ 1, 0],}

$DIRECTION = {  'N' => 0,
                'W' => 1,
                'S' => 2,
                'E' => 3,
                0   => 'N',
                1   => 'W',
                2   => 'S',
                3   => 'E'}

class Rover
    def initialize(x = 0, y = 0, d = 'N')
        @X = x
        @Y = y
        @D = d
    end

    def execute(cmd)
        if cmd == 'M'
            dx,dy = $VETOR[@D]
            @X += dx
            @Y += dy  
        elsif cmd == 'L'
            @D = $DIRECTION[($DIRECTION[@D] + 1) % 4]
        elsif cmd == 'R'
            @D = $DIRECTION[($DIRECTION[@D] - 1) % 4]
        else
            print "Error: command ",cmd,"\n"
        end
    end

    def position
        return "#{@X} #{@Y} #{@D}\n"
    end
end

def main()
    #print "this is main\n"

    lines = IO.readlines("input.txt")
    xmax,ymax = lines[0].strip.split
    xmax = xmax.to_i
    ymax = ymax.to_i

    for i in (1..lines.length-1).step(2)
        myrover = Rover.new(lines[i].split[0].to_i, lines[i].split[1].to_i, lines[i].split[2])
        #print myrover.position
        lines[i + 1].strip.each_char do |char|myrover.execute(char) end
        open('output.txt', 'a') { |f|
            f << myrover.position
        }
        #print myrover.position
    end
end

if __FILE__ == $0
    main()
end