package com.ia.sample

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.asPaddingValues
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.systemBars
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.wrapContentHeight
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.LocationOn
import androidx.compose.material.icons.filled.Star
import androidx.compose.material3.Icon
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.ia.sample.ui.theme.SampleTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            SampleTheme {
                Scaffold(
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(WindowInsets.systemBars.asPaddingValues()),
                    topBar = {
                        Row(
                            modifier =
                                Modifier
                                    .height(56.dp)
                                    .padding(horizontal = 24.dp),
                            horizontalArrangement = Arrangement.spacedBy(10.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Image(
                                painter = painterResource(R.drawable.profile),
                                contentDescription = null,
                                modifier = Modifier
                                    .padding(vertical = 8.dp)
                                    .clip(CircleShape)
                            )
                            Column(modifier = Modifier.weight(1f)) {
                                Row(verticalAlignment = Alignment.CenterVertically) {
                                    Text("Hi Welcome ", fontSize = 14.sp, color = Color(0xFFA9AAAC))
                                    Image(
                                        painter = painterResource(R.drawable.baseline_waving_hand_24),
                                        contentDescription = null,
                                        modifier = Modifier.size(14.dp)
                                    )
                                }
                                Row(horizontalArrangement = Arrangement.spacedBy(6.dp)) {
                                    Text(
                                        "User Name",
                                        fontSize = 16.sp,
                                        fontWeight = FontWeight.W600,
                                        color = Color(0xFF292D32)
                                    )
                                    Row(
                                        modifier = Modifier
                                            .border(
                                                0.5.dp,
                                                color = Color(0x260173A5),
                                                RoundedCornerShape(16.dp)
                                            )
                                            .background(Color(0x030173A5))
                                            .padding(horizontal = 4.dp, vertical = 2.dp),
                                        horizontalArrangement = Arrangement.spacedBy(4.dp),
                                        verticalAlignment = Alignment.CenterVertically
                                    ) {
                                        Image(
                                            painter = painterResource(R.drawable.scratch_6),
                                            contentDescription = null
                                        )
                                        Text(
                                            "100",
                                            fontWeight = FontWeight.W700,
                                            color = Color(0xFF0173A5)
                                        )


                                    }
                                }

                            }
                            Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                                Icon(
                                    painter = painterResource(R.drawable.fav_icon),
                                    contentDescription = null
                                )
                                Image(
                                    painter = painterResource(R.drawable.notification),
                                    contentDescription = null
                                )
                            }
                        }


                    }) { innerPadding ->

                    screenView(innerPadding)
                }
            }
        }
    }
}


@Composable
fun screenView(innerPadding: PaddingValues) {
    Column(
        modifier = Modifier.padding(innerPadding),
        verticalArrangement = Arrangement.spacedBy(22.dp)
    ) {
        val pagerState = rememberPagerState(pageCount = { 4 })
        val bottomPagerState = rememberPagerState(pageCount = { 4 })
        Row(
            modifier = Modifier
                .padding(horizontal = 24.dp)
                .padding(top = 22.dp)
        ) {
            Text(
                "Packages from travel experts",
                color = Color(0xFF292D32),
                fontSize = 16.sp,
                fontWeight = FontWeight.W600,
                modifier = Modifier.weight(1f)
            )
            Row(
                Modifier
                    .wrapContentHeight()
                    .padding(bottom = 8.dp),
                horizontalArrangement = Arrangement.Center
            ) {
                repeat(pagerState.pageCount) { iteration ->
                    val isSelected = pagerState.currentPage == iteration
                    val color =
                        if (isSelected) Color(0xFF0173A5) else Color(0xFFA9AAAC)
                    Box(
                        modifier = Modifier
                            .padding(2.dp)
                            .clip(CircleShape)
                            .background(color)
                            .size(
                                width = if (isSelected) 24.dp else 8.dp,
                                height = 8.dp
                            )
                    )
                }
            }
        }
        HorizontalPager(
            state = pagerState,
            modifier = Modifier
                .fillMaxWidth(),
            contentPadding = PaddingValues(horizontal = 32.dp),
            pageSpacing = 24.dp,
        ) { page ->
            Image(
                painter = painterResource(R.drawable.image),
                contentDescription = null,
                modifier = Modifier
                    .fillMaxWidth(), // Adjust to your image's aspect ratio
                contentScale = ContentScale.Crop
            )
        }
        Row(
            horizontalArrangement = Arrangement.spacedBy(20.dp),
            modifier = Modifier.padding(horizontal = 24.dp)
        ) {
            Box(
                modifier = Modifier
                    .weight(1f)
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(20.dp)),
                contentAlignment = Alignment.Center
            ) {
                // Background image
                Image(
                    painter = painterResource(R.drawable.reseve_a_table),
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )

                // Foreground column centered over image
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(6.dp),
                    modifier = Modifier.padding(12.dp) // Optional padding
                ) {
                    Image(
                        painter = painterResource(R.drawable.restaurant_icon),
                        contentDescription = null,
                        modifier = Modifier.size(40.dp)
                    )

                    Text(
                        text = "Reserve a Table",
                        fontWeight = FontWeight.W500,
                        fontSize = 16.sp,
                        color = Color.White
                    )
                }
            }

            Box(
                modifier = Modifier
                    .weight(1f)
                    .aspectRatio(1f)
                    .clip(RoundedCornerShape(20.dp)),
                contentAlignment = Alignment.Center
            ) {
                Image(
                    painter = painterResource(R.drawable.trip_image),
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize(), // This is important to make it fill the box
                    contentScale = ContentScale.Crop     // Ensures the image covers the area
                )

                // Foreground column centered over image
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(6.dp),
                    modifier = Modifier.padding(12.dp) // Optional padding
                ) {
                    Image(
                        painter = painterResource(R.drawable.trip_icon), // Foreground icon
                        contentDescription = null,
                        modifier = Modifier.size(40.dp) // Or any size that fits visually
                    )

                    Text(
                        text = "Plan a trip",
                        fontWeight = FontWeight.W500,
                        fontSize = 16.sp,
                        color = Color.White
                    )
                }
            }
        }

        Row(
            modifier = Modifier
                .padding(horizontal = 24.dp)
                .fillMaxWidth()
        ) {
            Text(
                "Top Restaurants",
                fontSize = 16.sp,
                fontWeight = FontWeight.W600,
                color = Color(0xFF292D32),
                modifier = Modifier.weight(1f)
            )
            Text(
                "See All",
                fontSize = 14.sp,
                fontWeight = FontWeight.W500,
                color = Color(0xFF0173A5),
                modifier = Modifier
            )
        }
        HorizontalPager(
            state = bottomPagerState,
            modifier = Modifier
                .fillMaxWidth(), // Removed background for testing, add back if needed
            contentPadding = PaddingValues(horizontal = 32.dp), // For next/prev page preview
            pageSpacing = 24.dp
        ) { page ->


            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .aspectRatio(1.5f) // Controls height — tweak this as needed
                    .clip(RoundedCornerShape(16.dp)),
                contentAlignment = Alignment.Center
            ) {
                // Background image
                Image(
                    painter = painterResource(R.drawable.cafe),
                    contentDescription = null,
                    modifier = Modifier.fillMaxSize(),
                    contentScale = ContentScale.Crop
                )

                // Foreground column centered over image
                Column(
                    verticalArrangement = Arrangement.SpaceBetween,
                    modifier = Modifier
                        .fillMaxSize()
                        .padding(12.dp) // Padding inside the content
                ) {
                    Row {
                        Text(
                            "2 Star Hotel",
                            fontSize = 10.sp,
                            fontWeight = FontWeight.W700,
                            color = Color.White,
                            modifier = Modifier
                                .clip(RoundedCornerShape(6.dp))
                                .background(Color(0x4DFE3333))
                                .padding(horizontal = 8.dp, vertical = 4.dp)
                        )
                        Spacer(Modifier.weight(1f))
                        Image(
                            painter = painterResource(R.drawable.fav_icon),
                            contentDescription = null
                        )
                    }

                    GlassmorphicHotelCard()
                }
            }
        }
    }
}


// Extension function to create Color from hex string if needed (already provided in previous response)
// fun Color(hex: String) = Color(android.graphics.Color.parseColor("#$hex"))

@Composable
fun GlassmorphicHotelCard() {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 10.dp, vertical = 10.dp) // Add some horizontal padding for the card itself
    ) {
        // This Box will create the rounded corner shape and apply the blur
        // and the base glassmorphism effect (linear gradient)
        Box(
            modifier = Modifier
                .matchParentSize()
                .clip(RoundedCornerShape(20.dp))
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            Color(0xFF8B8B8B).copy(alpha = 0.5f), // Slightly less opaque for the base to allow blur to show
                            Color(0xFF6B6B6B).copy(alpha = 0.6f)
                        ),
                        start = Offset(0f, 0f),
                        end = Offset(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY)
                    )
                )
                .blur(radius = 10.dp) // Apply blur here
        )

        // This Box will add the radial gradient on top, without being blurred itself by the above blur.
        // It's part of the glassmorphism appearance.
        Box(
            modifier = Modifier
                .matchParentSize()
                .clip(RoundedCornerShape(20.dp)) // Clip again to maintain shape
                .background(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            Color(0xD4D4D4).copy(alpha = 0.5f), // Use Color(hex) and then copy with alpha
                            Color(0xB8B8B8).copy(alpha = 0.5f),
                            Color(0x8B8B8B).copy(alpha = 0.5f),
                            Color(0x6B6B6B).copy(alpha = 0.5f)
                        ),
                    )
                )
        )

        // Border on top of everything
        Box(
            modifier = Modifier
                .matchParentSize()
                .clip(RoundedCornerShape(20.dp)) // Clip again for the border
                .border(
                    width = 1.dp,
                    color = Color.White.copy(alpha = 0.3f), // White border with transparency
                    shape = RoundedCornerShape(20.dp)
                )
        )

        // Hotel information content laid out on top
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(vertical = 10.dp, horizontal = 16.dp) // Add padding for content inside
        ) {
            Row {
                Text(
                    text = "Nobu Doha",
                    color = Color.White,
                    fontSize = 20.sp, // Adjusted font size
                    fontWeight = FontWeight.W600
                )
                Spacer(Modifier.weight(1f))
                Column {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.Star,
                            contentDescription = null,
                            tint = Color(0xFFFFCD1A), // Gold color
                            modifier = Modifier.size(16.dp) // Adjusted icon size
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            text = 4.4.toString(),
                            color = Color(0xFFFFCD1A),
                            fontSize = 14.sp, // Adjusted font size
                            fontWeight = FontWeight.W400
                        )
                        Text(
                            text = " (532)",
                            color = Color.White,
                            fontSize = 14.sp, // Adjusted font size
                            fontWeight = FontWeight.W400
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(8.dp)) // Increased spacer height

            Row(
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        imageVector = Icons.Default.LocationOn,
                        contentDescription = null,
                        tint = Color.White.copy(alpha = 0.8f),
                        modifier = Modifier.size(20.dp) // Adjusted icon size
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = "504 Corniche Rode",
                        color = Color.White,
                        fontSize = 14.sp, // Adjusted font size
                        fontWeight = FontWeight.Normal
                    )
                }
                Spacer(Modifier.weight(1f))
                Column(
                    horizontalAlignment = Alignment.End
                ) {
                    Text(
                        text = "300 - 500 QAR",
                        color = Color.White,
                        fontSize = 16.sp, // Adjusted font size
                        fontWeight = FontWeight.W500
                    )

                    Spacer(modifier = Modifier.height(8.dp)) // Increased spacer height
                    Box(
                        modifier = Modifier
                            .background(
                                Color.White.copy(alpha = 0.3f),
                                RoundedCornerShape(12.dp)
                            )
                            .border(
                                0.5.dp,
                                Color.White.copy(alpha = 0.4f),
                                RoundedCornerShape(12.dp)
                            )
                            .padding(
                                horizontal = 5.dp, // Adjusted padding
                                vertical = 1.dp
                            )
                    ) {
                        Text(
                            text = "Recommended For You",
                            color = Color.White.copy(
                                alpha = 0.9f
                            ),
                            fontSize = 8.sp, // Adjusted font size
                            fontWeight = FontWeight.Normal
                        )
                    }
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun PreviewGlassmorphicHotelCard() {
    // A dark background helps to visualize the glassmorphism effect
    Box(modifier = Modifier.fillMaxSize().background(Color.DarkGray)) {
        GlassmorphicHotelCard()
    }
}

@Preview
@Composable
fun preview() {
    screenView(PaddingValues(0.dp, 0.dp))
}
