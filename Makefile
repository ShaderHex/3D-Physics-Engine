CXX = g++
CXXFLAGS = -std=c++17 -O2

SRC = main.cpp glad/glad.c \
      stb/stb_image.h \
      imgui/imgui.cpp \
      imgui/imgui_draw.cpp \
      imgui/imgui_tables.cpp \
      imgui/imgui_widgets.cpp \
      imgui/imgui_demo.cpp \
      imgui/backends/imgui_impl_glfw.cpp \
      imgui/backends/imgui_impl_opengl3.cpp

OUT = app

INCLUDES = -Iglad -Iimgui -Iimgui/backends

LIBS = -lglfw -ldl -lGL

all: $(OUT)

$(OUT): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(OUT) $(SRC) $(INCLUDES) $(LIBS)

run: $(OUT)
	./$(OUT)

clean:
	rm -f $(OUT) *.o
