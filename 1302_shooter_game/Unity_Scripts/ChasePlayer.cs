using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
public class ChasePlayer : EnemyBase
{

    private float firerate = 1f;
    private float firenexttime = 0;

    public AudioClip Fire;
    AudioSource Audio1;

    public Transform Spawnpoint;

    // Use this for initialization
    public void Start()
    {
        Audio1 = GetComponent<AudioSource>();

    }
    public void Update()
    {
    }
    // Update is called once per frame
    public override void move()
    {
        transform.LookAt(Player.position);
        transform.position += transform.forward * 4 * Time.deltaTime;
    }

    public override void attack()
    {
        //this enemy's attack is a suicide charge
    }
}
