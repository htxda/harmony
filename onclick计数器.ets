@Entry
@ComponentV2
struct Index {
  @Local num: number=1
  build() {
Column(){

  Row(){

    Text('-')
      .width(60)
      .height(60)
      .border({width:1,color:'#999',radius:{topLeft:3,bottomLeft:3}})
      //左上角的圆角半径为 3vp
      .textAlign(TextAlign.Center)
      .fontSize(28)
      .onClick(() =>{
        if(this.num>1)
        {
          this.num--
        }

      })

    Text(this.num.toString())
      .width(60)
      .height(60)
      .textAlign(TextAlign.Center)
      .border({width:{top:1,bottom:1},color:'#999'})//上下边框的宽度为 1vp
      .fontSize(28)

    Text('+')
      .width(60)
      .height(60)
      .border({width:1,color:'#999',radius:{topRight:3,bottomRight:3}})
      .textAlign(TextAlign.Center)
      .fontSize(28)
      .onClick(() =>{
        this.num++
      })
  }
   .padding(50)

}
   .padding(20)

  }
}
