using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class Hit2 : MonoBehaviour
{

    GameObject player;
	// Use this for initialization
	void Start ()
    {
        player = GameObject.Find("Player");
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            SceneManager.LoadScene("CSE1302_Project 1");

        }
        //if (other.CompareTag("Ground"))
        //{
        //    Destroy(gameObject);
        //}
        //if (other.CompareTag("Wall"))
        //{
        //    Destroy(player);
        //}

    }
}
