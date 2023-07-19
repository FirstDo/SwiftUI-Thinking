import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Group {
                NavigationLink("Text", destination: TextExample())
                NavigationLink("Shape", destination: ShapeExample())
                NavigationLink("Color", destination: ColorExample())
                NavigationLink("Gradients", destination: GradientsExample())
                NavigationLink("Images", destination: ImagesExample())
                NavigationLink("Frames", destination: FrameExamples())
                NavigationLink("BackgroundOverlay", destination: BackgroundOverlayExample())
                NavigationLink("Stacks", destination: StacksExample())
                NavigationLink("Padding", destination: PaddingExample())
                NavigationLink("Spacer", destination: SpacerExample())
            }

            Group {
                NavigationLink("ForEach", destination: ForEachExample())
                NavigationLink("ScrollView", destination: ScrollViewExample())
                NavigationLink("Grid", destination: GridExample())
                NavigationLink("SafeArea", destination: SafeAreaExample())
                NavigationLink("Button", destination: ButtonExample())
                NavigationLink("@State", destination: StateExample())
                NavigationLink("@Binding", destination: BindingExample())
                NavigationLink("ConditionalStatementExample", destination: ConditionalStatementExample())
                NavigationLink("AnimationExample", destination: AnimationExample())
                NavigationLink("AnimationTiming", destination: AnimationTimingExample())
            }
            
            Group {
                NavigationLink("Transition", destination: TransitionExample())
                NavigationLink("SheetAndFullScreenCoverExample", destination: SheetAndFullScreenCoverExample())
                NavigationLink("Popover", destination: PopoverExample())
                NavigationLink("NavigationLink", destination: NavigationViewAndLinkExample())
                NavigationLink("NavigationStack", destination: NavigationStackExample())
                NavigationLink("List", destination: ListExample())
                NavigationLink("Alert", destination: AlertExample())
                NavigationLink("ActionSheet", destination: ActionSheetExample())
                NavigationLink("ContextMenu", destination: ContextMenuExample())
                NavigationLink("TextField", destination: TextFieldExample())
            }
            
            Group {
                NavigationLink("TextEditor", destination: TextEditorExample())
                NavigationLink("Toggle", destination: ToggleExample())
                NavigationLink("Picker", destination: PickerExample())
                NavigationLink("ColorPicker", destination: ColorPickerExample())
                NavigationLink("DatePicker", destination: DatePickerExample())
                NavigationLink("Stepper", destination: StepperExample())
                NavigationLink("Slider", destination: SliderExample())
                NavigationLink("TabView", destination: TabViewExample())
                NavigationLink("OnAppear", destination: OnAppearExample())
                NavigationLink("TapGesture", destination: TapGestureExample())
            }
            
            Group {
                NavigationLink("StateObject, ObservableObject", destination: StateObjectAndObservableObjectExample())
                NavigationLink("EnvironemntObject", destination: EnvironmentObjectExample())
                NavigationLink("AppStorage", destination: AppStorageExample())
                NavigationLink("AsyncImage", destination: AsyncImageExample())
                NavigationLink("BackgroundMaterial", destination: BackgroundMaterialExample())
                NavigationLink("TextSelection", destination: TextSelectionExample())
                NavigationLink("ButtonStyle", destination: ButtonStyleExample())
                NavigationLink("ListSwipeActions", destination: ListSwipeActionsExample())
                NavigationLink("SubmitTextField", destination: SubmitTextFieldExample())
            }
        }
        .navigationTitle("내용")
    }
}
