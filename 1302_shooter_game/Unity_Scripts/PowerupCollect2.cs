using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PowerupCollect2 : MonoBehaviour {

    //public AudioClip collectClip;
    //private AudioSource collectSource;
    public AudioClip collectClip;
    private GameObject player; 

    void Start()
    {
        //collectSource = GetComponent<AudioSource>();
        player = GameObject.Find("Player");
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Destroy(gameObject);
            WeaponSelect.addWeapon(this.gameObject.name);
            Debug.Log(this.gameObject.name);
            AudioSource.PlayClipAtPoint(collectClip, player.transform.position, .5f);
        }
    }
}
