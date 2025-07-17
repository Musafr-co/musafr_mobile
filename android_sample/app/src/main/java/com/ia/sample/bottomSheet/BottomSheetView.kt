package com.ia.sample.bottomSheet


import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import coil.compose.AsyncImage
import coil.request.ImageRequest
import kotlinx.coroutines.launch

@Composable
fun BottomSheetContent() {
    var textFieldValue by remember { mutableStateOf("") }
    var selectedRadioOption by remember { mutableStateOf("Option 1") }
    var isSwitchEnabled by remember { mutableStateOf(false) }
    var isChecked by remember { mutableStateOf(false) }
    var isLoading by remember { mutableStateOf(false) }
    var showError by remember { mutableStateOf(false) }

    val radioOptions = listOf("Option 1", "Option 2")

    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(16.dp)
            .verticalScroll(rememberScrollState()),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {

        // Label
        Text(
            text = "This is a label",
            fontSize = 16.sp,
            fontWeight = FontWeight.Medium,
            color = MaterialTheme.colorScheme.onSurface
        )

        // Edit Text (TextField)
        OutlinedTextField(
            value = textFieldValue,
            onValueChange = { textFieldValue = it },
            label = { Text("Enter text here") },
            placeholder = { Text("Edit Text Placeholder") },
            modifier = Modifier.fillMaxWidth(),
            singleLine = true
        )

        // Radio Button Group
        Text(
            text = "Select an option:",
            fontSize = 14.sp,
            fontWeight = FontWeight.Medium
        )

        Column {
            radioOptions.forEach { option ->
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .selectable(
                            selected = (selectedRadioOption == option),
                            onClick = { selectedRadioOption = option }
                        )
                        .padding(vertical = 4.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    RadioButton(
                        selected = (selectedRadioOption == option),
                        onClick = { selectedRadioOption = option }
                    )
                    Text(
                        text = option,
                        modifier = Modifier.padding(start = 8.dp)
                    )
                }
            }
        }

        // Checkbox
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.fillMaxWidth()
        ) {
            Checkbox(
                checked = isChecked,
                onCheckedChange = { isChecked = it }
            )
            Text(
                text = "This is a checkbox",
                modifier = Modifier.padding(start = 8.dp)
            )
        }

        // Switch
        Row(
            verticalAlignment = Alignment.CenterVertically,
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Switch(
                checked = isSwitchEnabled,
                onCheckedChange = { isSwitchEnabled = it }
            )
            Text(
                text = "This is a switch",
                fontSize = 16.sp
            )
        }

        // Primary Button
        Button(
            onClick = {
                isLoading = true
                // Simulate loading
                kotlinx.coroutines.CoroutineScope(kotlinx.coroutines.Dispatchers.Main).launch {
                    kotlinx.coroutines.delay(2000)
                    isLoading = false
                }
            },
            modifier = Modifier,
            enabled = !isLoading
        ) {
            Text("Primary Button")
        }

        // Error Button
        Button(
            onClick = { showError = !showError },
            modifier = Modifier,
            colors = ButtonDefaults.buttonColors(
                containerColor = MaterialTheme.colorScheme.error
            )
        ) {
            Text("Error Button")
        }

        // Error Message (shown conditionally)
        if (showError) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.errorContainer
                )
            ) {
                Text(
                    text = "Error: Something went wrong!",
                    color = MaterialTheme.colorScheme.onErrorContainer,
                    modifier = Modifier.padding(12.dp)
                )
            }
        }

        // Loading Indicator
        if (isLoading) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp)
                )
                Text(
                    text = "Loading...",
                    modifier = Modifier.padding(start = 8.dp)
                )
            }
        }

        // Full Width Button (at the bottom)
        Button(
            onClick = { /* Handle action */ },
            modifier = Modifier.fillMaxWidth(),
            colors = ButtonDefaults.buttonColors(
                containerColor = MaterialTheme.colorScheme.secondary
            )
        ) {
            Text("Full Width Button")
        }

        // Add some bottom padding for better UX
        Spacer(modifier = Modifier.height(16.dp))
    }
}

@Preview(showBackground = true)
@Composable
fun DefaultPreview() {

        BottomSheetContent()

}
