import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = DeckViewModel()

    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Deck count: \(viewModel.count)")
                .font(.title)
            Text("Last: \(viewModel.lastItem)")
                .font(.footnote)
                .padding()

            Button(action: {
                viewModel.make()
            }) {
                Text("Add some items")
                    .font(.title)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(SwiftUICore.Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Text("Process time: \(viewModel.lastOpTime) ms")
                .font(.title2)
                .padding(10)
            Button(action: {
                viewModel.proc()
            }) {
                Text("Process")
                    .font(.title)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(SwiftUICore.Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
