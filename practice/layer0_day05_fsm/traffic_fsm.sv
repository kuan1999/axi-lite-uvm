module traffic_fsm #(
    // 1. Parameters(可選,在 #( ) 裡)
    parameter int TIME_RED    = 10,
    parameter int TIME_R_Y    = 2,
    parameter int TIME_GREEN  = 8,
    parameter int TIME_YELLOW = 2
)(
    // 2. Ports(輸入 / 輸出,在 ( ) 裡)
    input  logic       clk,
    input  logic       rst_n,
    output logic [2:0] light
);

    // 3. Internal signal / type 宣告(在 module body 開頭)
    typedef enum logic [1:0] {
        S_RED     = 2'b00,
        S_RED_YEL = 2'b01,
        S_GREEN   = 2'b10,
        S_YELLOW  = 2'b11
    } state_t;
    
    state_t state, next_state;
    logic [3:0] timer, next_timer;


always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= S_RED;
        timer <= 4'b0;
    end else begin
        state <= next_state;
        timer <= next_timer;
    end
end

always_comb begin
    next_state = state;
    next_timer = timer;
    
    case (state)
        S_RED: begin
            if (timer == TIME_RED - 1) begin
                next_state = S_RED_YEL;
                next_timer = 4'b0;
            end else begin
                next_state = S_RED;
                next_timer = timer + 1;
            end
        end
        
        S_RED_YEL: begin
            if (timer == TIME_R_Y - 1) begin
                next_state = S_GREEN;
                next_timer = 4'b0;
            end else begin
                next_state = S_RED_YEL;
                next_timer = timer + 1;
            end
        end
        
        S_GREEN: begin
            if (timer == TIME_GREEN - 1) begin
                next_state = S_YELLOW;
                next_timer = 4'b0;
            end else begin
                next_state = S_GREEN;
                next_timer = timer + 1;
            end
        end
        
        S_YELLOW: begin
            if (timer == TIME_YELLOW - 1) begin
                next_state = S_RED;
                next_timer = 4'b0;
            end else begin
                next_state = S_YELLOW;
                next_timer = timer + 1;
            end
        end
        
        default: begin
            next_state = S_RED;
            next_timer = 4'b0;
        end
    endcase
end
always_comb begin
    light = 3'b000;      
    case (state)
        S_RED:     light = 3'b100;
        S_RED_YEL: light = 3'b110;
        S_GREEN:   light = 3'b001;
        S_YELLOW:  light = 3'b010;
    endcase
end
endmodule