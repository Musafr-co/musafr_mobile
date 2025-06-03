package com.ia.sample.screen

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.PaddingValues
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
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
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.ia.sample.R


@Composable
fun screenView(innerPadding: PaddingValues) {
    Column(
        modifier = Modifier.padding(innerPadding),
        verticalArrangement = Arrangement.spacedBy(22.dp)
    ) {
        val topPagerState = rememberPagerState(pageCount = {
            4
        })
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
                repeat(topPagerState.pageCount) { iteration ->
                    val isSelected = topPagerState.currentPage == iteration
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
            state = topPagerState,
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


        BottomPagerView()
    }
}

@Composable
fun BottomPagerView() {
    val bottomPagerState = rememberPagerState(pageCount = {
        6
    })
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
                .aspectRatio(2f) // Controls height — tweak this as needed
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
                BlurBox()
            }
        }
    }
    TODO("Not yet implemented")
}


@Composable
fun BlurBox(
    hotelName: String = "Nobu Doha",
    address: String = "504 Corniche Rode",
    rating: Float = 4.4f,
    reviewCount: Int = 532,
    priceRange: String = "300 - 500",
    currency: String = "QAR",
    category: String = "2 Star Hotel",
    isRecommended: Boolean = true,
    onFavoriteClick: () -> Unit = {},
    onCardClick: () -> Unit = {}
) {

    Box(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(20.dp)),
    ) {
        // Blurred background box
        Box(
            modifier = Modifier
                .matchParentSize()
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent.copy(alpha = 0.75f),
                            Color.Transparent.copy(alpha = 1f)
                        )
                    ),
                    RoundedCornerShape(20.dp)
                )
                .background(
                    Brush.verticalGradient(
                        colors = listOf(
                            Color.Transparent.copy(alpha = 0.15f),
                            Color.Transparent.copy(alpha = 0.1f)
                        )
                    ),
                    RoundedCornerShape(20.dp)
                )
                .blur(radius = 6.dp)
                .border(
                    1.dp,
                    Color.White.copy(alpha = 0.3f),
                    RoundedCornerShape(20.dp)
                )
        )

        // Hotel information content (not blurred)
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp) // Add padding for content inside
        ) {
            Row {
                Text(
                    text = "Nobu Doha",
                    color = Color.White,
                    fontSize = 14.sp,
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
                            modifier = Modifier.size(20.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text(
                            text = 4.4.toString(),
                            color = Color(0xFFFFCD1A),
                            fontSize = 10.sp,
                            fontWeight = FontWeight.W400
                        )
                        Text(
                            text = " (532)",
                            color = Color.White,
                            fontSize = 10.sp,
                            fontWeight = FontWeight.W400
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(4.dp))

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
                        modifier = Modifier.size(16.dp)
                    )
                    Spacer(modifier = Modifier.width(4.dp))
                    Text(
                        text = "504 Corniche Rode",
                        color = Color.White,
                        fontSize = 10.sp,
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
                        fontSize = 18.sp,
                        fontWeight = FontWeight.Bold
                    )

                    Spacer(modifier = Modifier.height(4.dp))
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
                                horizontal = 12.dp,
                                vertical = 4.dp
                            )
                    ) {
                        Text(
                            text = "Recommended For You",
                            color = Color.White.copy(
                                alpha = 0.9f
                            ),
                            fontSize = 12.sp,
                            fontWeight = FontWeight.Medium
                        )
                    }
                }
            }
        }
    }
}

@Preview
@Composable
fun preview() {
    screenView(PaddingValues(0.dp, 0.dp))
}


@Preview
@Composable
fun preview3() {
    BlurBox()
}
