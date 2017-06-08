using System;
using System.Collections.Generic;

using Xamarin.Forms;

namespace Spawt
{
	public partial class Walkthrough : ContentPage
	{

		public Walkthrough()
		{
			InitializeComponent();


			//carousel.ItemsSource = new List<Image> { new Image { Source = "walkthrough1.png" }, new Image { Source = "walkthrough2.png" }, new Image { Source = "walkthrough3.png" }};
			Image[] walkthroughImages = { new Image { Source = "Walk 1@2x.png" }, new Image { Source = "Walk 2.png" }, new Image { Source = "Walk 3.png" } };
			carousel.ItemsSource = walkthroughImages;

			//carousel.ItemTemplate = new DataTemplate(typeof(Image));
			carousel.Position = 0;
			carousel.PositionSelected += PositionSelected;
		}


		private void PositionSelected(object sender, EventArgs e)
		{

			if (carousel.Position == 2)
				GoHome.TextColor = Color.Default;
		}

		async void GoHome_Clicked(object sender, EventArgs e)
		{
			await Navigation.PushModalAsync(new FirstTimeSearch());
			return;
		}

	}
}
