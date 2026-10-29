library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity count16_7seg is
    port (
        vt : in STD_LOGIC_VECTOR(15 downto 0);
        en : in STD_LOGIC;
        sa, sb, sc, sd, se, sf, sg : out STD_LOGIC
    );
end count16_7seg;

architecture Behavioral of count16_7seg is
    -- Segment order: a b c d e f g
    -- '1' = ON, '0' = OFF
    signal segments : STD_LOGIC_VECTOR(6 downto 0);
begin
    process(vt, en)
        variable count : integer range 0 to 16;
    begin
        count := 0;

        for i in vt'range loop
            if vt(i) = '1' then
                count := count + 1;
            end if;
        end loop;

        if en = '1' then
            case count is
                when 0  => segments <= "1111110"; -- 0
                when 1  => segments <= "0110000"; -- 1
                when 2  => segments <= "1101101"; -- 2
                when 3  => segments <= "1111001"; -- 3
                when 4  => segments <= "0110011"; -- 4
                when 5  => segments <= "1011011"; -- 5
                when 6  => segments <= "1011111"; -- 6
                when 7  => segments <= "1110000"; -- 7
                when 8  => segments <= "1111111"; -- 8
                when 9  => segments <= "1111011"; -- 9
                when 10 => segments <= "1110111"; -- A
                when 11 => segments <= "0011111"; -- b
                when 12 => segments <= "1001110"; -- C
                when 13 => segments <= "0111101"; -- d
                when 14 => segments <= "1001111"; -- E
                when 15 => segments <= "1000111"; -- F
                when others => segments <= "0000000";
            end case;
        else
            segments <= "0000000";
        end if;
    end process;

    sa <= segments(6);
    sb <= segments(5);
    sc <= segments(4);
    sd <= segments(3);
    se <= segments(2);
    sf <= segments(1);
    sg <= segments(0);
end Behavioral;