struct MakeMyFirstBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-250, maxHeight: 200)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
extension View {
    func AddMyFirstBackgroundStyle() -> some View {
        modifier(MakeMyFirstBackground())
    }
}

struct MakeMySecondBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: UIScreen.main.bounds.width-30, maxHeight: 200)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .font(.largeTitle)
    }
}
extension View {
    func AddMySecondBackgroundStyle() -> some View {
        modifier(MakeMySecondBackground())
    }
}

struct MakeAButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.blue)
            .font(.title2.bold())
            .frame(width: 200, height: 65, alignment: .center)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black, radius: 10, x: 8, y: 2)
    }
}
extension View {
    func AddMyButtonStyle() -> some View {
        modifier(MakeAButton())
    }
}
