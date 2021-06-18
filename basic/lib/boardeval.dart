import 'state.dart';

class BoardEvaluation{
  static List<int> cells = board.boardState;
  static bool win = false;
  static bool draw = false;

  static void update(){
    cells = board.boardState;
  }

  static void getWin(){
    for(int i = 0; i < 3; i++){
      int x = i*3;
      if(cells[0+x] == cells[1+x] && cells[1+x] == cells[2+x] && cells[0+x] != -1) {
        win = true;
      }if(cells[0+i] == cells[3+i] && cells[3+i] == cells[6+i] && cells[0+i] != -1) {
        win = true;
      }if(cells[0] == cells[4] && cells[4] == cells[8] && cells[4] != -1) {
        win = true;
      }if(cells[2] == cells[4] && cells[4] == cells[6] && cells[4] != -1) {
        win = true;
      }
    }
    if(!cells.contains(-1)){
      win = true;
      draw = true;
    }
  }

  static String printWin(int x){
    if(win){
      if(draw){
        return "Draw";
      } else if(x==1){
        return "Winner Green";
      }else if(x==0){
        return "Winner Yellow";
      }
    }return "";
  }

  static void printBoard(){
    print(cells);
  }
}