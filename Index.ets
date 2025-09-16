@Entry
@Component
struct Index {
  // 定义栏目数据数组，每个栏目包含标题和列表项
  private columnsData: ColumnItem[] = [
    {
      title: "猜你喜欢",
      items: [
        { imgUrl: "https://s21.ax1x.com/2025/07/09/pVQkPqU.jpg", title: "推荐商品1", desc: "精选优质商品" },
        { imgUrl: "https://s21.ax1x.com/2025/07/09/pVQkPqU.jpg", title: "推荐商品2", desc: "限时优惠" }
      ]
    },
    {
      title: "热门推荐",
      items: [
        { imgUrl: "https://s21.ax1x.com/2025/07/09/pVQkPqU.jpg", title: "热门商品1", desc: "销量领先" },
        { imgUrl: "https://s21.ax1x.com/2025/07/09/pVQkPqU.jpg", title: "热门商品2", desc: "用户好评" }
      ]
    },
    {
      title: "新品上市",
      items: [
        { imgUrl: "https://s21.ax1x.com/2025/07/09/pVQkPqU.jpg", title: "新品1", desc: "全新上市" },
        { imgUrl: "https://s21.ax1x.com/2025/07/09/pVQkPqU.jpg", title: "新品2", desc: "限时尝鲜" }
      ]
    }
  ];

  build() {
    // 使用Scroll组件实现滚动效果，替代Column的scrollable属性
    Scroll() {
      Column() {
        // 循环渲染所有栏目
        ForEach(this.columnsData, (column: ColumnItem) => {
          // 引用封装好的栏目组件
          ColumnComponent({
            title: column.title,
            items: column.items
          })
        })
      }
      .width('100%')
      .padding({ left: 10, right: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#131313')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}

// 定义列表项数据类型
interface ListItemData {
  imgUrl: string;
  title: string;
  desc: string;
}

// 定义栏目数据类型
interface ColumnItem {
  title: string;
  items: ListItemData[];
}

// 封装栏目组件
@Component
struct ColumnComponent {
  // 接收外部传入的参数
  @Prop title: string;
  @Prop items: ListItemData[];

  build() {
    Column() {
      // 栏目标题
      Text(this.title)
        .fontColor('#fff')
        .fontSize(18)
        .width('100%')
        .margin({ bottom: 10, top: 20 })

      // 栏目列表 - 明确设置宽高属性
      List() {
        ForEach(this.items, (item: ListItemData) => {
          ListItem() {
            // 引用列表项组件
            ItemComponent({ itemData: item })
          }
        })
      }
      .width('100%')
      .height('auto') // 根据内容自动调整高度
      .margin({ bottom: 10 })
    }
  }
}

// 封装列表项组件
@Component
struct ItemComponent {
  @Prop itemData: ListItemData;

  build() {
    Row() {
      // 左侧图片
      Image(this.itemData.imgUrl)
        .width('80vp')
        .height('80vp')
        .borderRadius(8)
        .margin({ right: 10 })
        .objectFit(ImageFit.Cover)
        .alt("商品图片")

      // 中间文字区域
      Column() {
        Text(this.itemData.title)
          .fontColor('#fff')
          .fontSize(16)
          .lineHeight(24)

        Text(this.itemData.desc)
          .fontColor('#AAAAAA')
          .fontSize(14)
          .lineHeight(20)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      // 右侧更多图标
      Image('https://s21.ax1x.com/2025/07/09/pVQkka4.jpg')
        .width('24vp')
        .height('24vp')
        .borderRadius(8)
        .margin({ right: 10 })
        .backgroundColor('#FEFEFE')
        .alt("更多按钮")
    }
    .width('100%')
    .height(80)
    .margin({ bottom: 10 })
  }
}
